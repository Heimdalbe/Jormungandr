from Backend.models import Sponsor, NavTopItem, ImageUrl


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


def image_urls(request):
    # We only need the key to access it and the url it contains
    urls = {s.key: s.url for s in ImageUrl.objects.all()}
    return {'urls': urls}
