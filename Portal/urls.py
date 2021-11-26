from django.conf.urls import re_path
from Portal.views import *

app_name = 'Portal'

urlpatterns = [
    re_path(r'^$', index, name="index"),
    re_path(r'^access_denied', access_denied, name='access_denied'),
    re_path(r'^events', event_management, name='events')
]
