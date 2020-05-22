from django.contrib.auth.models import User
from django.db import models, IntegrityError
from django.db.models.signals import post_save
from markdownx.models import MarkdownxField
from multiselectfield import MultiSelectField


class CMS(models.Model):
    name = models.CharField(max_length=128)
    title = models.CharField(max_length=128)
    description = MarkdownxField(default=None)

    def __str__(self):
        return self.name


class Profile(models.Model):
    STATUS_CHOICES = {
        ('ACTIVE', 'Active'),
        ('DISABLED', 'Disabled')
    }
    GESLACHT_CHOICES = {
        ('MAN', 'Man'),
        ('VROUW', 'Vrouw'),
        ('ANDERS', 'Anders')
    }
    INTERESSE_CHOICES = (
        ('LOL', 'League Of Legends'),
        ('CS:GO', 'CS:GO')
    )

    user = models.OneToOneField(User, on_delete=models.CASCADE)
    gsm = models.CharField(max_length=50, blank=True)
    geslacht = models.CharField(max_length=50, choices=GESLACHT_CHOICES, blank=True)
    interesses = MultiSelectField(choices=INTERESSE_CHOICES, blank=True)
    mails = models.BooleanField(default=False)
    policy_approved = models.BooleanField(default=False)

    votes = models.PositiveSmallIntegerField(default=1)
    status = models.CharField(max_length=50, choices=STATUS_CHOICES, default='ACTIVE')
    election_active = models.BooleanField(default=False)

    def __str__(self):
        return self.user.first_name + " " + self.user.last_name

    def can_vote(self):
        if self.user.first_name and self.user.last_name:
            return True
        else:
            return False

    def valid_user(self):
        if self.policy_approved:
            return True
        else:
            return False


def create_profile(sender, **kwargs):
    user = kwargs["instance"]
    if kwargs["created"]:
        user_profile = Profile(user=user)
        user_profile.save()


post_save.connect(create_profile, sender=User)


class Election(models.Model):
    titel = models.CharField(max_length=200)
    uitleg = models.CharField(max_length=200, blank=True)
    visible = models.BooleanField(default=False)
    order = models.IntegerField(default=10)

    def __str__(self):
        return self.titel

    def getRounds(self):
        return self.round_set.filter(visible=True).order_by('titel')


class Round(models.Model):
    election = models.ForeignKey(Election, on_delete=models.CASCADE)
    titel = models.CharField(max_length=200)
    actief = models.BooleanField(default=True)
    visible = models.BooleanField(default=False)
    resultatenactief = models.BooleanField(default=False)

    def __str__(self):
        return self.election.titel + ": " + self.titel


class Choice(models.Model):
    round = models.ForeignKey(Round, on_delete=models.CASCADE)
    keuze = models.CharField(max_length=200)
    votes = models.IntegerField(default=0)

    def __str__(self):
        return self.round.__str__() + " - " + self.keuze

    def vote(self, user):
        if not user.profile.can_vote():
            return 'profile_incomplete'
        if user.profile.election_active:
            try:
                UserVotes.create(user=user, round=self.round, votes=user.profile.votes)
                self.votes += user.profile.votes
                self.save()
            except IntegrityError:
                return 'already_voted'
            return 'ok'
        else:
            return 'no_permission'


class UserVotes(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE, related_name="user_votes")
    round = models.ForeignKey(Round, on_delete=models.CASCADE, related_name="round_votes")
    votes = models.IntegerField(default=0)

    def __str__(self):
        return self.round.election.titel + ": " + self.round.titel

    class Meta:
        unique_together = ('user', 'round')
