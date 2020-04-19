from django.shortcuts import render, get_object_or_404

from Backend.models import CMS


def index(request):

    return render(request, 'Jormungandr/index.html', {})


def cms(request, page):
    page = get_object_or_404(CMS, name=page)
    return render(request, 'Jormungandr/cms.html', {'page': page})

