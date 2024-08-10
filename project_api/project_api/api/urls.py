from django.urls import path
from .views import (
    barinak_delete, barinak_list, barinak_add, hayvan_delete, hayvan_list, hayvan_add, ilgilenir_list, personel_add, personel_delete, 
    personel_list, sahiplenen_delete, sahiplenen_list, sahiplenen_add, sponsor_add, sponsor_delete, sponsor_list, 
    sponsor_oldu_list, ziyaret_edildi_list, ziyaretci_add, ziyaretci_delete, ziyaretci_list
)

urlpatterns = [
    path('barinak/', barinak_list, name='barinak_list'),
    path('barinak/add/', barinak_add, name='barinak_add'),
    path('barinak/delete/<int:pk>/', barinak_delete, name='barinak_delete'),
    
    path('hayvan/', hayvan_list, name='hayvan_list'),
    path('hayvan/add/', hayvan_add, name='hayvan_add'),
    path('hayvan/delete/<int:hayvan_id>/', hayvan_delete, name='hayvan_delete'),

    path('ilgilenir/', ilgilenir_list, name='ilgilenir_list'),

    path('personel/', personel_list, name='personel_list'),
    path('personel/add/', personel_add, name='personel_add'),
    path('personel/delete/<int:personel_id>/', personel_delete, name='personel_delete'),

    path('sahiplenen/', sahiplenen_list, name='sahiplenen_list'),
    path('sahiplenen/add/', sahiplenen_add, name='sahiplenen_add'),
     path('sahiplenen/delete/<int:sahiplenme_id>/', sahiplenen_delete, name='sahiplenen_delete'),

    path('sponsor/', sponsor_list, name='sponsor_list'),
    path('sponsor/add/', sponsor_add, name='sponsor_add'),
    path('sponsor/delete/<int:sponsor_id>/', sponsor_delete, name='sponsor_delete'),

    path('sponsor-oldu/', sponsor_oldu_list, name='sponsor_oldu_list'),

    path('ziyaret-edildi/', ziyaret_edildi_list, name='ziyaret_edildi_list'),

    path('ziyaretci/', ziyaretci_list, name='ziyaretci_list'),
    path('ziyaretci/add/', ziyaretci_add, name='ziyaretci_add'),
    path('ziyaretci/delete/<int:ziyaretci_id>/', ziyaretci_delete, name='ziyaretci_delete')
]
