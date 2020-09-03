from django.contrib.auth.models import User
from django.forms import ModelForm

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
