from django.shortcuts import render, get_object_or_404, redirect

from django.views import View
from django.core.mail import send_mail
from Backend.forms import ContactForm
from Backend.models import *


def index(request):
    return render(request, 'Jormungandr/index.html', {"pictures": Picture.objects.filter(is_carousel_pic=True)})


def cms(request, page):
    page = get_object_or_404(CMS, name=page)
    return render(request, 'Jormungandr/cms.html', {'page': page})


def praesidia(request):
    years = PraesidiumYear.objects.all().order_by('start')
    selected_year = years.last()
    members = PraesidiumFunctionYearMember.objects.all()

    if request.method == 'GET':
        year = request.GET.get("year")
        if year:
            selected_year = PraesidiumYear.objects.filter(start__year=year).get()
        members = members.filter(praesidium_year=selected_year)

    return render(request, 'Jormungandr/praesidium.html',
                  {'praesidium': members, "years": years, "selectedyear": selected_year})


def events(request):
    _events = Event.objects.order_by('-start')
    return render(request, 'Jormungandr/events.html', {'events': _events})


def event(request, pk):
    _event = get_object_or_404(Event, pk=pk)
    return render(request, 'Jormungandr/event.html', {'event': _event})


def albums(request):
    _albums = PhotoAlbum.objects.all().order_by('created_at')
    return render(request, 'Jormungandr/gallery.html', {'albums': _albums})


def gallery(request, pk):
    _album = get_object_or_404(PhotoAlbum, pk=pk)
    return render(request, 'Jormungandr/pictures.html', {'album': _album})


def praesidium(request, pk):
    praesidium_lid = get_object_or_404(PraesidiumMember, pk=pk)
    return render(request, 'Jormungandr/erelid.html', {'praesidium_lid': praesidium_lid})


def handler404(request, *args, **argv):
    return render(request, 'Jormungandr/404.html', status=404)


def handler500(request, *args, **argv):
    return render(request, 'Jormungandr/500.html', status=500)


class SendMail(View):
    def post(self, request):
        form = ContactForm(request.POST)

        previous = request.GET["next"]

        if not form.is_valid():
            return redirect(previous)

        self.format_send_mail(form.cleaned_data)
        return redirect(previous)

    def format_send_mail(self, form):
        subject = "Mail sent by: {}".format(form.get("name"))
        message = "Subject: {}\n\n{}\n\n{}\n\nYou can respond to: {}" \
            .format(form.get("subject"), form.get("message"), "=" * 20, form.get("email"))
        send_mail(
            subject,
            message,
            "",
            ["test@heimdal.be"],
            fail_silently=False
        )
