from django.contrib import admin
from .models import Barinak, Hayvan, Ilgilenir, Personel, Sahiplenen, Sponsor, SponsorOldu, ZiyaretEdildi, Ziyaretci

class BarinakAdmin(admin.ModelAdmin):
    list_display = ('barinak_id', 'isim', 'adres', 'telefon', 'mail')

class HayvanAdmin(admin.ModelAdmin):
    list_display = ('hayvan_id', 'isim', 'tur', 'cins', 'cinsiyet', 'yas', 'saglik_durumu', 'sahiplenme_durum', 'giris_tarihi', 'barinak')

class IlgilenirAdmin(admin.ModelAdmin):
    list_display = ('ilgilenir_id', 'ilgi_personel', 'ilgi_hayvan')
    search_fields = ('ilgi_personel__isim', 'ilgi_hayvan__isim')
    readonly_fields = ('ilgilenir_id',)

class PersonelAdmin(admin.ModelAdmin):
    list_display = ('personel_id', 'isim', 'soyisim', 'telefon', 'mail', 'barinak')

class SahiplenenAdmin(admin.ModelAdmin):
    list_display = ('sahiplenme_id', 'hayvan', 'isim', 'soyisim', 'telefon', 'mail')

class SponsorAdmin(admin.ModelAdmin):
    list_display = ('sponsor_id', 'isim', 'telefon', 'mail')

class SponsorOlduAdmin(admin.ModelAdmin):
    list_display = ('sponsor_id', 'sp_sponsor', 'sp_hayvan', 'bagis_miktari')
    search_fields = ('sp_sponsor__isim', 'sp_hayvan__isim')
    readonly_fields = ('sponsor_id',)

class ZiyaretEdildiAdmin(admin.ModelAdmin):
    list_display = ('ziyaret_id', 'ziyaret_ziyaretci', 'ziyaret_barinak', 'ziyaret_tarihi')
    search_fields = ('ziyaret_ziyaretci__isim', 'ziyaret_barinak__isim')
    readonly_fields = ('ziyaret_id',)

class ZiyaretciAdmin(admin.ModelAdmin):
    list_display = ('ziyaretci_id', 'isim', 'soyisim', 'telefon', 'mail')

admin.site.register(Barinak, BarinakAdmin)
admin.site.register(Hayvan, HayvanAdmin)
admin.site.register(Ilgilenir, IlgilenirAdmin)
admin.site.register(Personel, PersonelAdmin)
admin.site.register(Sahiplenen, SahiplenenAdmin)
admin.site.register(Sponsor, SponsorAdmin)
admin.site.register(SponsorOldu, SponsorOlduAdmin)
admin.site.register(ZiyaretEdildi, ZiyaretEdildiAdmin)
admin.site.register(Ziyaretci, ZiyaretciAdmin)