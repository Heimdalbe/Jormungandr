from django.conf.urls import url
from Portal.views import index, access_denied

app_name = 'Portal'

urlpatterns = [
    url(r'^$', index, name="index"),
    # url(r'^edit_profile', edit_profile, name='edit_profile'),
    url(r'^access_denied', access_denied, name='access_denied'),
]
