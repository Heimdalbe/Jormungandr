from django.contrib import admin, messages
from django.contrib.auth.admin import UserAdmin
from django.urls import resolve
from django.utils.translation import ngettext

from .models import *

admin.site.register(Choice)
admin.site.register(CMS)
admin.site.register(Election)
admin.site.register(Round)
admin.site.register(PraesidiumMember)
admin.site.register(PraesidiumFunction)
admin.site.register(PraesidiumYear)
admin.site.register(PraesidiumFunctionYearMember)
admin.site.register(Sponsor)
admin.site.register(PhotoAlbum)
admin.site.register(Picture)
admin.site.register(EventGenre)
admin.site.register(Event)
admin.site.register(NavTopItem)
admin.site.register(NavSubItem)
admin.site.register(GraphNode)
admin.site.register(FooterPage)


class PictureInline(admin.TabularInline):
    model = Picture
    extra = 1


class PhotoAlbumAdmin(admin.ModelAdmin):
    inlines = [
        PictureInline,
    ]


class ProfileInline(admin.StackedInline):
    model = Profile
    can_delete = False
    verbose_name_plural = 'Profile'
    fk_name = 'user'


class CustomUserAdmin(UserAdmin):
    inlines = (ProfileInline,)

    def get_inline_instances(self, request, obj=None):
        if not obj:
            return list()
        return super(CustomUserAdmin, self).get_inline_instances(request, obj)


class CustomProfileAdmin(admin.ModelAdmin):
    actions = ['activate_user', 'de_activate_user']
    list_display = ['user', '__str__', 'role', 'election_active', 'votes']
    list_filter = ['election_active', 'role']
    ordering = ['role']

    def activate_user(self, request, queryset):
        activated = queryset.update(election_active=True)
        self.message_user(request, ngettext(
            '%d lid was successfully marked as active for the election.',
            '%d leden were successfully marked as active for the election.',
            activated,
        ) % activated, messages.SUCCESS)

    def de_activate_user(self, request, queryset):
        activated = queryset.update(election_active=False)
        self.message_user(request, ngettext(
            '%d lid was successfully marked as inactive for the election.',
            '%d leden were successfully marked as inactive for the election.',
            activated,
        ) % activated, messages.SUCCESS)

    activate_user.short_description = 'Activeer election user'
    de_activate_user.short_description = 'Deactiveer election user'


admin.site.unregister(User)
admin.site.register(User, CustomUserAdmin)
admin.site.register(Profile, CustomProfileAdmin)
admin.site.unregister(PhotoAlbum)
admin.site.unregister(Picture)
admin.site.register(PhotoAlbum, PhotoAlbumAdmin)
