from Backend.forms import ContactForm


def contact_form(request):
    return {'contact': ContactForm()}
