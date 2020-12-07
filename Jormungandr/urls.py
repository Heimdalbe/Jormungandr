"""untitled URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
# from django.contrib import admin
from django.conf.urls import url
from django.contrib import admin
from django.urls import include

from Jormungandr.settings import secrets
from Jormungandr.views import *

urlpatterns = [
    url(r'^admin/', admin.site.urls),
    url(r'^markdownx/', include('markdownx.urls')),
    url(r'^intranet/', include('Intranet.urls')),
    url(r'^$', index, name="index"),
    url(r'^albums/$', albums, name="albums"),
    url(r'^statuten/$', statuten, name="statuten"),
    url(r'^gallery/(?P<pk>[0-9]+)?/$', gallery, name="gallery"),
    url(r'^events/$', events, name="events"),
    url(r'^event/(?P<pk>[0-9]+)?/$', event, name="event"),
    url(r'^praesidium/$', praesidia, name="praesidia"),
    url(r'^sendmail/$', send_mail_contact, name="sendmail"),
    url(r'^praesidium/(?P<pk>[0-9]+)?/$', praesidium, name="praesidium"),
    url(r'^(?P<page>.*)/$', cms, name='cms'),
]

if not secrets.DEBUG:
    handler400 = 'Jormungandr.views.handler400'
    handler403 = 'Jormungandr.views.handler403'
    handler404 = 'Jormungandr.views.handler404'
    handler500 = 'Jormungandr.views.handler500'

