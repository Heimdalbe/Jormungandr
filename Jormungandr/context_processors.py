from Backend.models import Sponsor, NavTopItem


def sponsors(request):
    return {'sponsors': Sponsor.objects.all()}


def menu(request):
    return {'menu': NavTopItem.objects.all()}


def parameters(request):
    try:
        contact = request.GET["contact"]
    except:
        contact = "NA"

    return {'contact': contact}
