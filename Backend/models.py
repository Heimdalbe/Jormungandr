from django.contrib.auth.models import User
from django.db import models, IntegrityError
from django.db.models.signals import post_save
from markdownx.models import MarkdownxField
from multiselectfield import MultiSelectField


class CMSType(models.Model):
    name = models.CharField(max_length=128)
    display = models.CharField(max_length=128)
    displayorder = models.IntegerField(null=True, blank=True)

    def __str__(self):
        return self.display


class CMS(models.Model):
    name = models.CharField(max_length=128)
    title = models.CharField(max_length=128)
    description = MarkdownxField(default=None)
    type = models.ForeignKey(CMSType, on_delete=models.CASCADE, null=True, blank=True)
    displayorder = models.IntegerField(null=True, blank=True)

    def __str__(self):
        return self.name

    def to_json_serializable(self):
        return {"name": self.name, "title": self.title, "description": self.description, "type": self.type, "order":
                self.displayorder}


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
                UserVotes.objects.create(user=user, round=self.round, votes=user.profile.votes)
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


class PraesidiumYear(models.Model):
    start = models.DateTimeField()
    end = models.DateTimeField()

    def __str__(self):
        return str(self.start) + " - " + str(self.end)


class PraesidiumFunction(models.Model):
    name = models.CharField(max_length=50)
    email = models.EmailField()
    order = models.SmallIntegerField()

    def __str__(self):
        return self.name


class PraesidiumMember(models.Model):
    first_name = models.CharField(max_length=50)
    last_name = models.CharField(max_length=100)
    email = models.EmailField()
    phone = models.CharField(max_length=20, null=True)
    photo = models.URLField(null=True)
    quote = models.CharField(max_length=200, null=True)
    description = models.CharField(max_length=200, null=True)
    trivia = MarkdownxField()
    facebook_link = models.URLField(null=True)
    linkedin_link = models.URLField(null=True)
    twitter_link = models.URLField(null=True)
    instagram_link = models.URLField(null=True)

    def __str__(self):
        return self.first_name + ": " + self.last_name


class PraesidiumFunctionYearMember(models.Model):
    praesidium_year = models.ForeignKey(PraesidiumYear, on_delete=models.CASCADE)
    praesidium_member = models.ForeignKey(PraesidiumMember, on_delete=models.CASCADE)
    praesidium_function = models.ForeignKey(PraesidiumFunction, on_delete=models.CASCADE)

    def __str__(self):
        return self.praesidium_year.__str__() + " " + self.praesidium_function.__str__()


class Sponsor(models.Model):
    name = models.CharField(max_length=100, unique=True)
    website = models.URLField()
    logo = models.ImageField(upload_to='sponsor', null=True)
    inverted_color = models.BooleanField(default=False)

    def __str__(self):
        return self.name


class PhotoAlbum(models.Model):
    name = models.CharField(max_length=100)
    created_at = models.DateTimeField()
    order = models.SmallIntegerField()

    def __str__(self):
        return self.name


class Picture(models.Model):
    name = models.CharField(max_length=100)
    description = models.CharField(max_length=300, null=True)
    link = models.CharField(max_length=150, unique=True)
    is_carousel_pic = models.BooleanField(default=False)
    album = models.ForeignKey(PhotoAlbum, on_delete=models.CASCADE)

    def __str__(self):
        return self.album.__str__() + " - " + self.name


class EventGenre(models.Model):
    name = models.CharField(max_length=64, unique=1)
    description = MarkdownxField(default=None)
    logo = models.ImageField(upload_to='event_type')

    def __str__(self):
        return self.name


class Event(models.Model):
    name = models.CharField(max_length=128)
    description = MarkdownxField(default=None, null=1)
    url = models.CharField(max_length=1024, blank=1, null=1)
    poster = models.ImageField(upload_to='events')
    start = models.DateTimeField()
    end = models.DateTimeField()
    location = models.CharField(max_length=256)
    genre = models.ForeignKey(EventGenre, on_delete=models.CASCADE)
    is_open = models.BooleanField(default=1)

    def __str__(self):
        return self.name


