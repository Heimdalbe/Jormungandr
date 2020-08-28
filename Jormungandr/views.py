from django.shortcuts import render, get_object_or_404
from typing import List
import json

from Backend.models import CMS, PraesidiumMember, PraesidiumYear, PraesidiumInfoLine


def index(request):
    return render(request, 'Jormungandr/index.html', {})


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


# if request.method == 'GET':         user = request.GET.get("user")
# month = request.GET.get("month")
# if user:             if
# month: queryset_list = Shift.objects.filter(user_id=user, start_timemonth=month.split("|")[0],
#                                             start_timeyear=month.split("|")[1]).order_by('-start_time')
# direct += "?user=" + request.GET.get("user")
# direct += "%26month=" + request.GET.get("month")
# context['url_user'] = int(user)
# context['url_month'] = month             else:                 queryset_list = Shift.objects.filter(
#     user_id=user).order_by('-start_time')
# direct += "?user=" + request.GET.get("user")
# context['url_user'] = int(user) elif month: queryset_list = Shift.objects.filter(start_timemonth=month.split("|")[0],
#                                                                                  start_timeyear=month.split("|")


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
