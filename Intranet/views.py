from django.contrib.auth import logout, authenticate, login, update_session_auth_hash
from django.contrib.auth.decorators import login_required, user_passes_test
from django.contrib.auth.forms import PasswordChangeForm, UserCreationForm
from django.shortcuts import render, redirect, get_object_or_404
from django.urls import reverse

from Backend.forms import *
from Backend.models import Election, Round, Choice, UserVotes, UserRole
from Jormungandr.views import handler403, handler404


@login_required
def index(request):
    return render(request, 'Intranet/index.html', )


@login_required
def logout_user(request):
    logout(request)
    return redirect('index')


def login_user(request):
    if request.method == "POST":
        username = request.POST['username']
        password = request.POST['password']
        user = authenticate(username=username, password=password)
        if user is not None:
            if user.is_active:
                login(request, user)
                return redirect(reverse('Intranet:index'))
            else:
                return render(request, 'Intranet/login.html', {'error_message': 'Your account has been disabled'})
        else:
            return render(request, 'Intranet/login.html', {'error_message': 'Invalid login'})
    return render(request, 'Intranet/login.html')


def register(request):
    if request.method == 'POST':
        form = UserCreationForm(request.POST)
        if form.is_valid():
            form.save()
            username = form.cleaned_data.get('username')
            raw_password = form.cleaned_data.get('password1')
            user = authenticate(username=username, password=raw_password)
            login(request, user)
            return redirect('Intranet:edit_profile')
        else:
            print(form.errors)
    else:
        form = UserCreationForm()
    return render(request, 'Intranet/register.html', {'form': form})


@login_required
def edit_profile(request):
    if request.method == 'POST':
        user_form = EditUserForm(request.POST, instance=request.user)
        profile_form = EditProfileForm(request.POST, instance=request.user.profile)
        if not request.POST.get('policy_approved'):
            return render(request, 'Intranet/edit_profile.html', {
                'user_form': user_form,
                'profile_form': profile_form,
                'error': "Je moet akkoord zijn met de Privacy Policy om het Intranet te kunnen gebruiken."
            })
        if user_form.is_valid() and profile_form.is_valid():
            user_form.save()
            profile_form.save()

            return redirect('Intranet:index')
        else:
            return render(request, 'Intranet/edit_profile.html', {
                'user_form': user_form,
                'profile_form': profile_form
            })
    else:
        user_form = EditUserForm(instance=request.user)
        profile_form = EditProfileForm(instance=request.user.profile)

    return render(request, 'Intranet/edit_profile.html', {
        'user_form': user_form,
        'profile_form': profile_form
    })


@login_required
def edit_password(request):
    if not request.user.is_authenticated:
        return render(request, 'Intranet/login.html')

    if request.method == 'POST':
        form = PasswordChangeForm(data=request.POST, user=request.user)
        if form.is_valid():
            form.save()
            update_session_auth_hash(request, form.user)
            return redirect('/intranet/edit_profile/')
        else:
            return render(request, 'Intranet/edit_password.html', {"form": form})

    else:
        form = PasswordChangeForm(user=request.user)
    return render(request, 'Intranet/edit_password.html', {"form": form})


def access_denied(request):
    return render(request, 'Intranet/access_denied.html')


@login_required
@user_passes_test(lambda u: u.profile.policy_approved, login_url='/intranet/access_denied')
def voting(request):
    if request.user.profile.role == UserRole.Anonymous:
        return handler403(request)

    context = {
        'elections': Election.objects.order_by('order'),
        'election_form': ElectionForm()
    }

    if 'status' in request.session:
        try:
            if request.session['status'] == 'ok':
                context['message'] = "Uw stem werd goed geregistreerd."
                del request.session['status']
            if request.session['status'] == 'not_yet':
                context['erMessage'] = "U mag hier nog niet stemmen."
                del request.session['status']
            if request.session['status'] == 'not_yet_detail':
                context['erMessage'] = "U kan hier (nog) niet stemmen."
                del request.session['status']
            if request.session['status'] == 'not_yet_result':
                context['erMessage'] = "De resultaten zijn nog niet open gezet."
                del request.session['status']
        except KeyError:
            pass
    return render(request, 'Intranet/voting.html', context)


@login_required
def round_detail(request, pk):
    if request.user.profile.role == UserRole.Anonymous:
        return handler403(request)

    round = Round.objects.filter(pk=pk).first()
    users = Profile.objects.filter(election_active=True)
    if round.actief or request.user.groups.filter(name='Kiescomite').count() != 0:
        return render(request, 'Intranet/round_vote.html', {'round': round, 'users': users})
    else:
        request.session['status'] = 'not_yet_detail'
        return redirect(reverse('Intranet:voting'))


@login_required
def round_edit(request, pk):
    if request.user.groups.filter(name='Kiescomite').count() == 0:
        return handler404(request)

    round = Round.objects.filter(pk=pk).first()
    option_more_than_0_votes = 0

    try:
        if request.session['option_more_than_0_votes']:
            option_more_than_0_votes = int(request.session['option_more_than_0_votes'])
            del request.session['option_more_than_0_votes']
    except KeyError:
        pass

    return render(request, 'Intranet/round_edit.html',
                  {'round': round, "option_more_than_0_votes": option_more_than_0_votes})


@login_required
def round_delete(request, pk):
    if request.user.groups.filter(name='Kiescomite').count() == 0:
        return handler404(request)

    s_round = Round.objects.filter(pk=pk).first()
    s_round.delete()

    return redirect(reverse('Intranet:voting') + "?deleted=ok")


@login_required
def round_vote(request, pk):
    if request.user.profile.role == UserRole.Anonymous:
        return handler403(request)

    if not request.user.profile.election_active or not request.user.profile.can_vote:
        return redirect(reverse('Intranet:voting'))

    round = get_object_or_404(Round, pk=pk)
    if round.actief:
        try:
            selected_choice = round.choice_set.get(pk=request.POST['choice'])
        except (KeyError, Choice.DoesNotExist):
            # Redisplay the question voting form.
            return render(request, 'Intranet/round_vote.html', {
                'round': round,
                'error_message': "Je moet een optie aanduiden.",
            })
        else:
            res = selected_choice.vote(request.user)
            if 'ok' in res:
                request.session['status'] = 'ok'
                return redirect(reverse('Intranet:voting'))
            if 'profile_incomplete' in res:
                return render(request, 'Intranet/round_vote.html', {
                    'round': round,
                    'users': Profile.objects.filter(election_active=True),
                    'error_message': "Je moet je naam en voornaam ingeven om te kunnen stemmen."
                })
            if 'no_permission' in res:
                return render(request, 'Intranet/round_vote.html', {
                    'round': round,
                    'users': Profile.objects.filter(election_active=True),
                    'error_message': "Je hebt geen toestemming om te stemmen."
                })
            return render(request, 'Intranet/round_vote.html', {
                'round': round,
                'users': Profile.objects.filter(election_active=True),
                'error_message': "Je hebt al gestemd in deze ronde."
            })
    else:
        request.session['status'] = 'not_yet'
        return redirect(reverse('Intranet:voting'))


@login_required
def round_results(request, pk):
    if request.user.profile.role == UserRole.Anonymous:
        return handler403(request)

    round = get_object_or_404(Round, pk=pk)
    roundVotes = UserVotes.objects.filter(round=round)
    if request.user.groups.filter(name='Kiescomite').count() != 0 or round.resultatenactief:
        return render(request, 'Intranet/round_results.html', {'round': round, 'roundVotes': roundVotes})
    else:
        request.session['status'] = 'not_yet_result'
        return redirect(reverse('Intranet:voting'))


@login_required
def add_election(request):
    if request.user.groups.filter(name='Kiescomite').count() == 0:
        return handler404(request)

    if request.method == 'POST':
        form = ElectionForm(request.POST)

        if form.is_valid():
            new = form.save()
            return redirect(reverse('Intranet:voting') + "#elections")

    return redirect(reverse('Intranet:voting') + "#form")


@login_required
def election_delete(request, pk):
    if request.user.groups.filter(name='Kiescomite').count() == 0:
        return handler404(request)

    s_election = get_object_or_404(Election, pk=pk)
    s_election.delete()

    return redirect(reverse('Intranet:voting') + "?deleted=ok")


@login_required
def election_add_round(request, pk):
    if request.user.groups.filter(name='Kiescomite').count() == 0:
        return handler404(request)

    s_election = get_object_or_404(Election, pk=pk)

    if request.method == 'POST':
        form = RoundForm(request.POST)

        if form.is_valid():
            new = s_election.add_round(form.cleaned_data['titel'], form.cleaned_data['actief'],
                                       form.cleaned_data['visible'], form.cleaned_data['resultatenactief'])
            return redirect(reverse('Intranet:round_edit', args=[new.pk]))
    else:
        form = RoundForm()

    return render(request, 'Intranet/round_add.html', {'form': form, 'election': s_election})


@login_required
def election_change_visible(request, pk):
    if request.user.groups.filter(name='Kiescomite').count() == 0:
        return handler404(request)

    selected_election = get_object_or_404(Election, pk=pk)
    selected_election.visible = not selected_election.visible
    selected_election.save()

    return redirect(request.GET['uri'])


@login_required
def round_add_choice(request, pk):
    if request.user.groups.filter(name='Kiescomite').count() == 0:
        return handler404(request)

    if request.POST:
        s_round = get_object_or_404(Round, pk=pk)

        if s_round.add_choice(request.POST['choice']) == 0:
            return redirect(request.GET['uri'])


@login_required
def round_change_visible(request, pk):
    if request.user.groups.filter(name='Kiescomite').count() == 0:
        return handler404(request)

    selected_round = get_object_or_404(Round, pk=pk)
    selected_round.visible = not selected_round.visible
    selected_round.save()

    return redirect(request.GET['uri'])


@login_required
def round_change_actief(request, pk):
    if request.user.groups.filter(name='Kiescomite').count() == 0:
        return handler404(request)

    selected_round = get_object_or_404(Round, pk=pk)
    selected_round.actief = not selected_round.actief
    selected_round.save()

    return redirect(request.GET['uri'])


@login_required
def round_change_resultaten(request, pk):
    if request.user.groups.filter(name='Kiescomite').count() == 0:
        return handler404(request)

    selected_round = get_object_or_404(Round, pk=pk)
    selected_round.resultatenactief = not selected_round.resultatenactief
    selected_round.save()

    return redirect(request.GET['uri'])


@login_required
def round_option_delete(request, pk, pk2):
    if request.user.groups.filter(name='Kiescomite').count() == 0:
        return handler404(request)

    selected_round = get_object_or_404(Round, pk=pk)
    selected_choice = get_object_or_404(Choice, pk=pk2)

    if selected_choice.round == selected_round:
        if selected_choice.votes == 0 or (request.GET['force'] is not None and request.GET['force'] == "true"):
            selected_choice.delete()
        else:
            request.session['option_more_than_0_votes'] = selected_choice.pk

    return redirect(request.GET['uri'])
