# -*- coding:utf-8 -*-
from __future__ import unicode_literals

# Stdlib imports

# Core Django imports
from django import template

# Third-party app imports

# Realative imports of the 'app-name' package
from django.utils.safestring import SafeString
from markdownx.utils import markdownify

register = template.Library()


@register.filter('has_group')
def has_group(user, group_name):
    """
    Verifica se este usuário pertence a um grupo
    """
    groups = user.groups.all().values_list('name', flat=True)
    return True if group_name in groups else False

@register.filter
def markdown(data):
    return SafeString(markdownify(data))


@register.filter
def lookup(dictionary,  key):
    return dictionary.get(key)
