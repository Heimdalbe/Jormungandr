from django.conf.urls import re_path
from django.contrib.auth import views as auth_views

from Intranet.views import index, edit_profile, edit_password, login_user, \
    logout_user, register, access_denied, voting, round_results, round_vote, round_detail, add_election, \
    election_change_visible, round_change_visible, round_change_actief, round_change_resultaten, round_edit, \
    round_add_choice, election_add_round, election_delete, round_delete, round_option_delete
from Backend.forms import UserPasswordResetForm

app_name = 'Intranet'

urlpatterns = [
    re_path(r'^$', index, name="index"),
    re_path(r'^edit_profile', edit_profile, name='edit_profile'),
    re_path(r'^edit_password', edit_password, name='edit_password'),
    re_path(r'^register', register, name='register'),
    re_path(r'^login_user', login_user, name='login_user'),
    re_path(r'^logout_user', logout_user, name='logout_user'),

    re_path(r'^password_reset/$',
            auth_views.PasswordResetView.as_view(
                template_name='intranet/password_reset_form.html',
                form_class=UserPasswordResetForm,
                email_template_name='intranet/password_reset_email.html',
                subject_template_name='intranet/password_reset_subject.txt',
                from_email='noreply@heimdal.be',
                success_url='done'
            ),
            name='password_reset'),
    re_path(r'^password_reset/done/$',
            auth_views.PasswordResetDoneView.as_view(template_name='intranet/password_reset_done.html'),
            name='password_reset_done'),
    re_path(r'^reset/(?P<uidb64>[0-9A-Za-z_\-]+)/(?P<token>[0-9A-Za-z]{1,13}-[0-9A-Za-z]{1,20})/$',
            auth_views.PasswordResetConfirmView.as_view(
                template_name='Intranet/password_reset_confirm.html',
                success_url='/intranet/reset/done'
            ), name='password_reset_confirm'),
    re_path(r'^reset/done/$',
            auth_views.PasswordResetCompleteView.as_view(
                template_name='intranet/password_reset_complete.html'
            ),
            name='password_reset_complete'),

    re_path(r'^voting/$', voting, name='voting'),

    re_path(r'^election/add$', add_election, name='add_election'),

    re_path(r'^election/(?P<pk>[0-9]+)/change_visible', election_change_visible, name='election_change_visible'),
    re_path(r'^election/(?P<pk>[0-9]+)/delete', election_delete, name='election_delete'),
    re_path(r'^election/(?P<pk>[0-9]+)/add_round', election_add_round, name='election_add_round'),

    re_path(r'^round/(?P<pk>[0-9]+)/detail', round_detail, name='round_detail'),
    re_path(r'^round/(?P<pk>[0-9]+)/edit', round_edit, name='round_edit'),
    re_path(r'^round/(?P<pk>[0-9]+)/delete', round_delete, name='round_delete'),
    re_path(r'^round/(?P<pk>[0-9]+)/vote', round_vote, name='round_vote'),
    re_path(r'^round/(?P<pk>[0-9]+)/results', round_results, name='round_results'),
    re_path(r'^round/(?P<pk>[0-9]+)/add_choice', round_add_choice, name='round_add_choice'),
    re_path(r'^round/(?P<pk>[0-9]+)/change_visible', round_change_visible, name='round_change_visible'),
    re_path(r'^round/(?P<pk>[0-9]+)/change_actief', round_change_actief, name='round_change_actief'),
    re_path(r'^round/(?P<pk>[0-9]+)/change_resultaten', round_change_resultaten, name='round_change_resultaten'),

    re_path(r'^round/(?P<pk>[0-9]+)/option/(?P<pk2>[0-9]+)/delete', round_option_delete, name='round_option_delete'),

    re_path(r'^access_denied', access_denied, name='access_denied'),
]
