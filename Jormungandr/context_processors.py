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

    try:
        deleted = request.GET["deleted"]
    except:
        deleted = "NA"

    try:
        option_more_than_0_votes = request.GET["option_more_than_0_votes"]
    except:
        option_more_than_0_votes = "NA"

    return {'contact': contact, 'deleted': deleted, 'option_more_than_0_votes': option_more_than_0_votes}
