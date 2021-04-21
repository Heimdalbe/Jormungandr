from django.contrib import admin
from django.contrib.auth.admin import UserAdmin

from .models import *

admin.site.register(Choice)
admin.site.register(CMS)
admin.site.register(Election)
admin.site.register(Round)
admin.site.register(UserVotes)
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


admin.site.unregister(User)
admin.site.register(User, CustomUserAdmin)
