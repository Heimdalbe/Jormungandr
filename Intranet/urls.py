from django.conf.urls import url
from Intranet.views import index, edit_profile, edit_password, login_user, \
    logout_user, register, access_denied, voting, detail, vote, results

app_name = 'Intranet'

urlpatterns = [
    url(r'^$', index, name="index"),
    url(r'^edit_profile', edit_profile, name='edit_profile'),
    url(r'^edit_password', edit_password, name='edit_password'),
    url(r'^register', register, name='register'),
    url(r'^login_user', login_user, name='login_user'),
    url(r'^logout_user', logout_user, name='logout_user'),

    url(r'^voting/$', voting, name='voting'),
    url(r'^voting/(?P<pk>[0-9]+)/detail', detail, name='detail'),
    url(r'^voting/(?P<pk>[0-9]+)/vote', vote, name='vote'),
    url(r'^voting/(?P<pk>[0-9]+)/results', results, name='results'),

    url(r'^access_denied', access_denied, name='access_denied'),
]
