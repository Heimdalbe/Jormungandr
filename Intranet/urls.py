from django.conf.urls import url
from Intranet.views import index, edit_profile, edit_password, login_user, \
    logout_user, register, access_denied, voting, round_results, round_vote, round_detail, add_election, \
    election_change_visible, round_change_visible, round_change_actief, round_change_resultaten, round_edit, \
    round_add_choice, election_add_round, election_delete, round_delete, round_option_delete

app_name = 'Intranet'

urlpatterns = [
    url(r'^$', index, name="index"),
    url(r'^edit_profile', edit_profile, name='edit_profile'),
    url(r'^edit_password', edit_password, name='edit_password'),
    url(r'^register', register, name='register'),
    url(r'^login_user', login_user, name='login_user'),
    url(r'^logout_user', logout_user, name='logout_user'),

    url(r'^voting/$', voting, name='voting'),

    url(r'^election/add$', add_election, name='add_election'),

    url(r'^election/(?P<pk>[0-9]+)/change_visible', election_change_visible, name='election_change_visible'),
    url(r'^election/(?P<pk>[0-9]+)/delete', election_delete, name='election_delete'),
    url(r'^election/(?P<pk>[0-9]+)/add_round', election_add_round, name='election_add_round'),

    url(r'^round/(?P<pk>[0-9]+)/detail', round_detail, name='round_detail'),
    url(r'^round/(?P<pk>[0-9]+)/edit', round_edit, name='round_edit'),
    url(r'^round/(?P<pk>[0-9]+)/delete', round_delete, name='round_delete'),
    url(r'^round/(?P<pk>[0-9]+)/vote', round_vote, name='round_vote'),
    url(r'^round/(?P<pk>[0-9]+)/results', round_results, name='round_results'),
    url(r'^round/(?P<pk>[0-9]+)/add_choice', round_add_choice, name='round_add_choice'),
    url(r'^round/(?P<pk>[0-9]+)/change_visible', round_change_visible, name='round_change_visible'),
    url(r'^round/(?P<pk>[0-9]+)/change_actief', round_change_actief, name='round_change_actief'),
    url(r'^round/(?P<pk>[0-9]+)/change_resultaten', round_change_resultaten, name='round_change_resultaten'),

    url(r'^round/(?P<pk>[0-9]+)/option/(?P<pk2>[0-9]+)/delete', round_option_delete, name='round_option_delete'),

    url(r'^access_denied', access_denied, name='access_denied'),
]
