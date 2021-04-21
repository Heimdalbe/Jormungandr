from enum import IntEnum

from django.contrib.auth.models import User
from django.db import models, IntegrityError
from django.db.models.signals import post_save
from markdownx.models import MarkdownxField
from multiselectfield import MultiSelectField
from enum import Enum


class UserRole(IntEnum):
    Admin = 1
    Developer = 2
    Praesidium = 3
    Lid = 4
    # afspraak : laatste rol is voor publieke pagina's en voor niet-bevestigde leden
    Anonymous = 5

    @classmethod
    def choices(cls):
        return [(key.value, key.name) for key in cls]


class CMS(models.Model):
    name = models.CharField(max_length=128)
    title = models.CharField(max_length=128)
    description = MarkdownxField(default=None)
    permission = models.IntegerField(choices=UserRole.choices(), default=len(UserRole.choices()),
                                     help_text="Stel toegangsrechten voor de pagina in. Standaard: voor iedereen "
                                               "toegankelijk")

    class Meta:
        verbose_name = 'Custom Pagina'
        verbose_name_plural = 'Custom Pagina\'s'

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
        ('GAMES', 'Games'),
        ('ANIME', 'Anime'),
        ('COSPLAY', 'Cosplay'),
        ('TABLETOPS', 'Tabletop Games'),
        ('SUPERHEROES', 'Superheroes')
    )

    user = models.OneToOneField(User, on_delete=models.CASCADE)
    gsm = models.CharField(max_length=50, blank=True)
    geslacht = models.CharField(max_length=50, choices=GESLACHT_CHOICES, blank=True)
    interesses = MultiSelectField(choices=INTERESSE_CHOICES, blank=True)
    mails = models.BooleanField(default=False)
    policy_approved = models.BooleanField(default=False)
    votes = models.PositiveSmallIntegerField(default=1)
    status = models.CharField(max_length=50, choices=STATUS_CHOICES, default='ACTIVE')
    role = models.IntegerField(choices=UserRole.choices(), default=len(UserRole.choices()))
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

    class Meta:
        verbose_name = 'Praesidium Werkjaar'
        verbose_name_plural = 'Praesidium Werkjaren'

    def __str__(self):
        return str(self.start) + " - " + str(self.end)


class PraesidiumFunction(models.Model):
    name = models.CharField(max_length=50)
    email = models.EmailField()
    order = models.SmallIntegerField()

    class Meta:
        verbose_name = 'Praesidium Functie'
        verbose_name_plural = 'Praesidium Functies'

    def __str__(self):
        return self.name


class PraesidiumMember(models.Model):
    first_name = models.CharField(max_length=50)
    last_name = models.CharField(max_length=100)
    email = models.EmailField()
    phone = models.CharField(max_length=20, blank=True, null=True)
    photo = models.URLField(null=True)
    quote = models.CharField(max_length=200, blank=True, null=True)
    description = models.CharField(max_length=200, blank=True, null=True)
    trivia = MarkdownxField()
    facebook_link = models.URLField(blank=True, null=True)
    linkedin_link = models.URLField(blank=True, null=True)
    twitter_link = models.URLField(blank=True, null=True)
    instagram_link = models.URLField(blank=True, null=True)

    class Meta:
        verbose_name = 'Data Praesidium Lid'
        verbose_name_plural = 'Data Praesidium Leden'

    def __str__(self):
        return self.first_name + ": " + self.last_name


class PraesidiumFunctionYearMember(models.Model):
    praesidium_year = models.ForeignKey(PraesidiumYear, on_delete=models.CASCADE)
    praesidium_member = models.ForeignKey(PraesidiumMember, on_delete=models.CASCADE)
    praesidium_function = models.ForeignKey(PraesidiumFunction, on_delete=models.CASCADE)

    class Meta:
        verbose_name = 'Praesidium Lid'
        verbose_name_plural = 'Praesidium Leden'

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
    visible = models.BooleanField(default=True)

    class Meta:
        verbose_name = 'Photo Album'
        verbose_name_plural = 'Photo Albums'

    def __str__(self):
        return self.name


class Picture(models.Model):
    name = models.CharField(max_length=100)
    description = models.CharField(max_length=300, blank=True, null=True)
    link = models.CharField(max_length=150, unique=True)
    is_carousel_pic = models.BooleanField(default=False)
    album = models.ForeignKey(PhotoAlbum, on_delete=models.CASCADE)

    def __str__(self):
        return self.album.__str__() + " - " + self.name


class EventGenre(models.Model):
    name = models.CharField(max_length=64, unique=1)
    description = MarkdownxField(default=None)
    logo = models.ImageField(upload_to='event_type')

    class Meta:
        verbose_name = 'Event Genre'
        verbose_name_plural = 'Event Genres'

    def __str__(self):
        return self.name


class Event(models.Model):
    name = models.CharField(max_length=128)
    description = MarkdownxField(default=None, null=True)
    url = models.CharField(max_length=1024, blank=True, null=True)
    poster = models.ImageField(upload_to='events')
    start = models.DateTimeField(null=True)
    end = models.DateTimeField(null=True)
    location = models.CharField(max_length=256)
    genre = models.ForeignKey(EventGenre, on_delete=models.CASCADE)
    is_open = models.BooleanField(default=1)
    max_registered = models.PositiveSmallIntegerField(null=True, blank=True)

    def __str__(self):
        return self.name

class NavTopItem(models.Model):
    titel = models.CharField(max_length=128)
    order = models.SmallIntegerField()
    url = models.URLField(default="http://127.0.0.1:8000/")
    # afspraak : laatste rol is voor publieke pagina's
    role = models.IntegerField(choices=UserRole.choices(), default=len(UserRole.choices()))

    class Meta:
        verbose_name = 'Menu Header'
        verbose_name_plural = 'Menu Headers'

    def __str__(self):
        return self.titel

    def get_sub(self):
        return NavSubItem.objects.filter(parent=self).order_by('order')


class NavSubItem(models.Model):
    titel = models.CharField(max_length=128)
    order = models.SmallIntegerField()
    url = models.URLField(default="http://127.0.0.1:8000/")
    # NOTE: having no topitem means it will not be displayed
    parent = models.ForeignKey(NavTopItem, null=True, blank=True, on_delete=models.SET_NULL)

    class Meta:
        verbose_name = 'Menu Item'
        verbose_name_plural = 'Menu Items'

    def __str__(self):
        return self.titel


class NodeDisplayType(models.TextChoices):
    FULL = "Full name"
    FIRSTNAMEFULL = "First name full, last name initial"
    INITIALS = "Initials"
    FIRSTINITIAL = "First name initial"
    NONE = "None"


class GraphNode(models.Model):
    name = models.CharField(max_length=128)
    photo = models.ImageField(upload_to="node_fills")
    display = models.CharField(max_length=50, choices=NodeDisplayType.choices, default=NodeDisplayType.NONE)
    parent = models.ForeignKey("self", blank=True, null=True, on_delete=models.SET_NULL)

    def __str__(self):
        return self.name + (" with parent " + self.parent.name if self.parent is not None else "")

    def display_name(self):
        if self.display == NodeDisplayType.FULL:
            return self.name
        elif self.display == NodeDisplayType.FIRSTNAMEFULL:
            full = self.name.split()
            first = full.pop(0)
            return first + " " + self.__to_initials(full)
        elif self.display == NodeDisplayType.INITIALS:
            return self.__to_initials(self.name.split())
        elif self.display == NodeDisplayType.FIRSTINITIAL:
            return self.name.split()[0][0] + "."
        return "?"

    def __to_initials(self, string):
        output = ""
        for i in string:
            output += i[0].upper() + ". "
        return output.strip()

    def get_y(self):
        return 0 if self.parent is None else self.parent.get_y() + 1
