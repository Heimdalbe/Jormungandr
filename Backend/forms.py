from django.contrib.auth.models import User
from django.forms import ModelForm
from django import forms

from Backend.models import Profile


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


