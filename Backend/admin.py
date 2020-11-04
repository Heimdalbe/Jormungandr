from django.contrib import admin
from django.contrib.auth.admin import UserAdmin
from django.contrib.auth.models import User

from .models import Choice, CMS, CMSType, Election, Profile, UserVotes, Round, \
    PraesidiumMember, PraesidiumFunction, PraesidiumYear, PraesidiumInfoLine, Sponsor, \
    CarouselPicture

admin.site.register(Choice)
admin.site.register(CMS)
admin.site.register(CMSType)
admin.site.register(Election)
admin.site.register(Round)
admin.site.register(UserVotes)
admin.site.register(PraesidiumMember)
admin.site.register(PraesidiumFunction)
admin.site.register(PraesidiumYear)
admin.site.register(PraesidiumInfoLine)
admin.site.register(Sponsor)
admin.site.register(CarouselPicture)


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
