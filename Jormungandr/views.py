from django.shortcuts import render, get_object_or_404
from typing import List
import json

from django.views import View
from django.views.generic import FormView

from Backend.forms import ContactForm
from Backend.models import CMS, PraesidiumMember, PraesidiumYear, PraesidiumInfoLine


def index(request):
    return render(request, 'Jormungandr/index.html', {})


# class IndexView(View):
#     template_name = "Jormungandr/index.html"
#
#     def get(self, request):
#         return render(request, self.template_name, {})


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
    quotes = sorted(PraesidiumInfoLine.objects.filter(member__year=year), key=lambda s: s.member.function.order)
    temp = list_to_dict(quotes)
    quotesjson = json.dumps(temp)

    return render(request, 'Jormungandr/praesidium.html',
                  {'praesidium': members, "years": years, "selectedyear": year.id, "quotes": quotesjson})


# class ContactForm(FormView):
#     form_class = ContactForm


def list_to_dict(lines: List[PraesidiumInfoLine]):
    dic = {}
    for item in lines:
        temp = item.member.id
        item = item.to_json_serializable()
        if temp in dic:
            dic[temp].append(item)
        else:
            dic[temp] = [item]
    return dic
    # return {item.member.id: item for item in lines}
