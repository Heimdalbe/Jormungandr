from datetime import datetime

from django.shortcuts import render, get_object_or_404, redirect

from django.core.mail import EmailMessage
from django.utils.timezone import make_aware

from Backend.forms import ContactForm
from Backend.models import *

from Jormungandr.util.tools import graph_nodes_to_json

import json


def index(request):
    time = datetime.now()
    dt = make_aware(time)

    return render(request, 'Jormungandr/index.html', {"pictures": Picture.objects.filter(is_carousel_pic=True),
                                                      'events': Event.objects.filter(start__gt=dt).order_by('start')})


def cms(request, page):
    page = get_object_or_404(CMS, name=page)
    if page.permission < UserRole.Anonymous:
        if request.user.is_authenticated:
            if request.user.profile.role <= page.permission:
                return render(request, 'Jormungandr/cms.html', {'page': page})
    else:
        return render(request, 'Jormungandr/cms.html', {'page': page})

    return handler403(request)


def praesidia(request):
    years = PraesidiumYear.objects.all().order_by('start')
    selected_year = years.last()
    members = PraesidiumFunctionYearMember.objects.all()

    if request.method == 'GET':
        year = request.GET.get("year")
        if year:
            selected_year = PraesidiumYear.objects.filter(start__year=year).get()
        members = members.filter(praesidium_year=selected_year).order_by('praesidium_function__order')

    return render(request, 'Jormungandr/praesidium.html',
                  {'praesidium': members, "years": years, "selectedyear": selected_year})


def events(request):
    time = datetime.now()
    dt = make_aware(time)
    _events = Event.objects.filter(start__gt=dt).order_by('start')
    return render(request, 'Jormungandr/events.html', {'events': _events})


def event(request, pk):
    if request.method == 'POST':
        print("post")
    _event = get_object_or_404(Event, pk=pk)
    return render(request, 'Jormungandr/event.html', {'event': _event})


def statuten(request):
    return render(request, 'Jormungandr/statuten.html')


def albums(request):
    _albums = PhotoAlbum.objects.filter(visible=True).order_by('created_at')
    return render(request, 'Jormungandr/gallery.html', {'albums': _albums})


def gallery(request, pk):
    _album = get_object_or_404(PhotoAlbum, pk=pk)
    if not _album.visible:
        return handler403(request)
    return render(request, 'Jormungandr/pictures.html', {'album': _album})


def praesidium(request, pk):
    praesidium_lid = get_object_or_404(PraesidiumMember, pk=pk)
    return render(request, 'Jormungandr/erelid.html', {'praesidium_lid': praesidium_lid})


def graph(request):
    return render(request, 'Jormungandr/graph.html',
                  {"graph_nodes": json.dumps(graph_nodes_to_json(GraphNode.objects.all()))})


def handler400(request, *args, **argv):
    return render(request, 'Jormungandr/400.html', status=400)


def handler403(request, *args, **argv):
    return render(request, 'Jormungandr/403.html', status=403)


def handler404(request, *args, **argv):
    return render(request, 'Jormungandr/404.html', status=404)


def handler500(request, *args, **argv):
    return render(request, 'Jormungandr/500.html', status=500)


def send_mail_contact(request):
    form = ContactForm(request.POST)
    redir = request.GET["next"]

    if request.POST:
        name = request.POST['name']
        email = request.POST['email']
        subject = request.POST['subject']
        message = request.POST['message']

        mailbody = "From " + name + " <" + email + ">\n" + message
        mail = EmailMessage(subject, mailbody, "contact@heimdal.be",
                            to=["gate@heimdal.be"])
        mail.send()

        return redirect(redir + "?contact=ok")

    return handler404(request)
