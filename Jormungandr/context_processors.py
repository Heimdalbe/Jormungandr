from Backend.models import Sponsor, NavTopItem, FooterPage


def sponsors(request):
    return {'sponsors': Sponsor.objects.all()}


def menu(request):
    return {'menu': NavTopItem.objects.all()}


def parameters(request):
    try:
        contact = request.GET["contact"]
    except:
        contact = "NA"

    try:
        deleted = request.GET["deleted"]
    except:
        deleted = "NA"

    return {'contact': contact, 'deleted': deleted}


def footer_pages(request):
    return {'footer_pages': FooterPage.objects.all()}
