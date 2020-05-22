from django.contrib.auth import logout, authenticate, login, update_session_auth_hash
from django.contrib.auth.decorators import login_required, user_passes_test
from django.contrib.auth.forms import PasswordChangeForm, UserCreationForm
from django.shortcuts import render, redirect, get_object_or_404

from Backend.forms import *
from Backend.models import Election, Round, Choice, UserVotes


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
                return redirect('Intranet:index')
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
            print (form.errors)
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
            return redirect('/Intranet/edit_profile/')
        else:
            return render(request, 'Intranet/edit_password.html', {"form": form})

    else:
        form = PasswordChangeForm(user=request.user)
    return render(request, 'Intranet/edit_password.html', {"form": form})


def access_denied(request):
    return render(request, 'Intranet/access_denied.html')


@login_required
@user_passes_test(lambda u: u.profile.policy_approved == True, login_url='/Intranet/access_denied')
def voting(request):
    context = {'elections': Election.objects.filter(visible=True).order_by('order')}
    if 'status' in request.session:
        try:
            if request.session['status'] == 'ok':
                context['message'] = "Uw stem werd goed geregistreerd."
                del request.session['status']
            if request.session['status'] == 'not_yet':
                context['message'] = "U mag hier nog niet stemmen."
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
def detail(request, pk):
    round = Round.objects.filter(pk=pk).first()
    users = Profile.objects.filter(election_active=True)
    if round.actief:
        return render(request, 'Intranet/vote.html', {'round': round, 'users': users})
    else:
        request.session['status'] = 'not_yet_detail'
        return redirect('/intranet/voting')


@login_required
def vote(request, pk):
    round = get_object_or_404(Round, pk=pk)
    if round.actief:
        try:
            selected_choice = round.choice_set.get(pk=request.POST['choice'])
        except (KeyError, Choice.DoesNotExist):
            # Redisplay the question voting form.
            return render(request, 'Intranet/vote.html', {
                'round': round,
                'error_message': "Je moet een optie aanduiden.",
            })
        else:
            res = selected_choice.vote(request.user)
            if 'ok' in res:
                request.session['status'] = 'ok'
                return redirect('/intranet/voting')
            if 'profile_incomplete' in res:
                return render(request, 'Intranet/vote.html', {
                    'round': round,
                    'users': Profile.objects.filter(election_active=True),
                    'error_message': "Je moet je naam en voornaam ingeven om te kunnen stemmen."
                })
            if 'no_permission' in res:
                return render(request, 'Intranet/vote.html', {
                    'round': round,
                    'users': Profile.objects.filter(election_active=True),
                    'error_message': "Je hebt geen toestemming om te stemmen."
                })
            return render(request, 'Intranet/vote.html', {
                'round': round,
                'users': Profile.objects.filter(election_active=True),
                'error_message': "Je al gestemd in deze ronde."
            })
    else:
        request.session['status'] = 'not_yet'
        return redirect('/intranet/voting')


@login_required
def results(request, pk):
    round = get_object_or_404(Round, pk=pk)
    roundVotes = UserVotes.objects.filter(round=round)
    if request.user.groups.filter(name='Kiescomite').count() != 0 or round.resultatenactief:
        return render(request, 'Intranet/results.html', {'round': round, 'roundVotes': roundVotes})
    else:
        request.session['status'] = 'not_yet_result'
        return redirect('/intranet/voting')
