from django.shortcuts import render, get_object_or_404, redirect

from django.views import View
from django.core.mail import send_mail
from Backend.forms import ContactForm
from Backend.models import *


def index(request):
    return render(request, 'Jormungandr/index.html', {"carousel": Picture.objects.filter(is_carousel_pic=True)})


def cms(request, page):
    page = get_object_or_404(CMS, name=page)
    return render(request, 'Jormungandr/cms.html', {'page': page})


def praesidium(request):
    years = sorted(PraesidiumYear.objects.all(), key=lambda s: s.start, reverse=True)
    year = years[0]  # Default year
    if request.method == "GET":
        chosenyear = request.GET.get("year")
        if chosenyear and chosenyear != "0":
            year = PraesidiumYear.objects.filter(id=chosenyear).get()
    members = sorted(PraesidiumMember.objects.filter(year=year), key=lambda s: s.function.order)

    return render(request, 'Jormungandr/praesidium.html',
                  {'praesidium': members, "years": years, "selectedyear": year.id})


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

