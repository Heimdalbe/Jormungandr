from Backend.models import Sponsor


def sponsors(request):
    return {'sponsors': Sponsor.objects.all()}


def parameters(request):
    try:
        contact = request.GET["contact"]
    except:
        contact = "NA"

    return {'contact': contact}
