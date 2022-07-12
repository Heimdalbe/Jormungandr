from django.contrib.auth.models import User
from django.forms import ModelForm
from django import forms
from django.contrib.auth.forms import PasswordResetForm

from Backend.models import Profile, Election, Round


class EditUserForm(ModelForm):
    class Meta:
        model = User
        fields = ['first_name', 'last_name', 'email']


class EditProfileForm(ModelForm):
    class Meta:
        model = Profile
        fields = ['gsm', 'geslacht', 'interesses', 'mails', 'policy_approved']

    def __init__(self, *args, **kwargs):
        super(EditProfileForm, self).__init__(*args, **kwargs)
        self.fields['geslacht'].widget.attrs = {'class': 'form-control'}


# class ContactForm
class ContactForm(forms.Form):
    name = forms.CharField(required=True, widget=forms.TextInput(
        attrs={"class": "form-control", "type": "text", "id": "name",
               "placeholder": "Your Name", "data-rule": "minlen:4",
               "data-msg": "Please enter at least 4 chars"}))
    email = forms.EmailField(required=True, widget=forms.TextInput(
        attrs={"class": "form-control", "type": "email", "id": "email",
               "placeholder": "Your Email", "data-rule": "email",
               "data-msg": "Please enter a valid email"}))
    subject = forms.CharField(required=True, widget=forms.TextInput(
        attrs={"class": "form-control", "type": "text", "id": "subject",
               "placeholder": "Subject", "data-rule": "minlen:8",
               "data-msg": "Please enter at least 8 chars of subject"}))
    message = forms.CharField(required=True, widget=forms.Textarea(
        attrs={"class": "form-control", "id": "contact-message",
               "placeholder": "Message", "data-rule": "required",
               "data-msg": "Please write something for us", "rows": "5"}))


class ElectionForm(ModelForm):
    class Meta:
        model = Election
        fields = ['titel', 'uitleg', 'visible', 'order']

    def __init__(self, *args, **kwargs):
        super(ElectionForm, self).__init__(*args, **kwargs)
        self.fields['titel'].widget.attrs = {'class': 'form-control col-sm-6 mb-2'}
        self.fields['uitleg'].widget.attrs = {'class': 'form-control mb-2'}
        self.fields['visible'].widget.attrs = {'class': 'form-control col-sm-2 mb-2'}
        self.fields['order'].widget.attrs = {'class': 'form-control col-sm-2 my-2'}


class RoundForm(ModelForm):
    class Meta:
        model = Round
        fields = ['titel', 'actief', 'visible', 'resultatenactief']

    def __init__(self, *args, **kwargs):
        super(RoundForm, self).__init__(*args, **kwargs)
        self.fields['titel'].widget.attrs = {'class': 'form-control col-sm-6 mb-2'}
        self.fields['actief'].widget.attrs = {'class': 'form-control col-sm-2 mb-2'}
        self.fields['visible'].widget.attrs = {'class': 'form-control col-sm-2 mb-2'}
        self.fields['resultatenactief'].widget.attrs = {'class': 'form-control col-sm-2'}


class UserPasswordResetForm(PasswordResetForm):
    def __init__(self, *args, **kwargs):
        super(UserPasswordResetForm, self).__init__(*args, **kwargs)

    email = forms.EmailField(label='', widget=forms.EmailInput(attrs={
        'class': 'form-control',
        'id': 'id_email',
        'placeholder': 'johndoe@email.com',
        'type': 'email',
        'name': 'email'
    }))
