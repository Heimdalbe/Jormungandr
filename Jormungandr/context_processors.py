from Backend.forms import ContactForm
from Backend.models import Sponsor


def contact_form(request):
    return {'contact': ContactForm()}


def sponsors(request):
    return {'sponsors': Sponsor.objects.all()}
