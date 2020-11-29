from Backend.forms import ContactForm
from Backend.models import Sponsor, CMS
from typing import List


def contact_form(request):
    return {'contact': ContactForm()}


def sponsors(request):
    return {'sponsors': Sponsor.objects.all()}




def list_to_dict(pages: List[CMS]):
    dic = {}
    for item in pages:
        temp = item.type
        # item = item.to_json_serializable()
        if temp in dic:
            dic[temp].append(item)
        else:
            dic[temp] = [item]
    print(dic.items())
    return dic
