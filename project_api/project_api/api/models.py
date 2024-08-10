from django.db import models

# Create your models here.
from django.db import models
from django.db.models import UniqueConstraint

class Barinak(models.Model):
    barinak_id = models.IntegerField(primary_key=True, db_column='BarinakID')
    isim = models.CharField(max_length=255, blank=True, null=True, db_column='Isim')
    adres = models.CharField(max_length=255, blank=True, null=True, db_column='Adres')
    telefon = models.CharField(max_length=15, blank=True, null=True, db_column='Telefon')
    mail = models.CharField(max_length=100, blank=True, null=True, db_column='Mail')

    class Meta:
        managed = False
        db_table = 'barinak'



class Hayvan(models.Model):
    hayvan_id = models.IntegerField(primary_key=True, db_column='HayvanID')
    isim = models.CharField(max_length=255, blank=True, null=True, db_column='Isim')
    tur = models.CharField(max_length=50, blank=True, null=True, db_column='Tur')
    cins = models.CharField(max_length=50, blank=True, null=True, db_column='Cins')
    cinsiyet = models.CharField(max_length=10, blank=True, null=True, db_column='Cinsiyet')
    yas = models.IntegerField(blank=True, null=True, db_column='Yas')
    saglik_durumu = models.CharField(max_length=50, blank=True, null=True, db_column='Saglik_Durumu')
    sahiplenme_durum = models.CharField(max_length=50, blank=True, null=True, db_column='Sahiplenme_Durumu')
    giris_tarihi = models.DateField(blank=True, null=True, db_column='Giris_Tarihi')
    barinak = models.ForeignKey(Barinak, on_delete=models.CASCADE, db_column='HayvanBarinakID')

    class Meta:
        managed = False
        db_table = 'hayvan'



class Ilgilenir(models.Model):
    ilgilenir_id = models.AutoField(primary_key=True, db_column='IlgilenirId')
    ilgi_personel = models.ForeignKey('Personel', on_delete=models.CASCADE, db_column='IlgiPersonelID')
    ilgi_hayvan = models.ForeignKey('Hayvan', on_delete=models.CASCADE, db_column='IlgiHayvanID')

    class Meta:
        managed = False
        db_table = 'ilgilenir'
        unique_together = ('ilgi_personel', 'ilgi_hayvan')
    
    def __str__(self):
        return f"{self.ilgilenir_id}: Personel {self.ilgi_personel_id} - Hayvan {self.ilgi_hayvan_id}"



class Personel(models.Model):
    personel_id = models.IntegerField(primary_key=True, db_column='PersonelID')
    isim = models.CharField(max_length=255, blank=True, null=True, db_column='Ad')
    soyisim = models.CharField(max_length=255, blank=True, null=True, db_column='Soyad')
    telefon = models.CharField(max_length=15, blank=True, null=True, db_column='Telefon')
    mail = models.CharField(max_length=100, blank=True, null=True, db_column='Mail')
    barinak = models.ForeignKey(Barinak, on_delete=models.CASCADE, db_column='PersonelBarinakID')

    class Meta:
        managed = False
        db_table = 'personel'



class Sahiplenen(models.Model):
    sahiplenme_id = models.IntegerField(primary_key=True, db_column='Sahiplenen_ID')
    hayvan = models.ForeignKey(Hayvan, on_delete=models.CASCADE, db_column='SahiplenenHayvanID')
    isim = models.CharField(max_length=255, blank=True, null=True, db_column='Ad')
    soyisim = models.CharField(max_length=255, blank=True, null=True, db_column='Soyad')
    telefon = models.CharField(max_length=15, blank=True, null=True, db_column='Telefon')
    mail = models.CharField(max_length=100, blank=True, null=True, db_column='Mail')

    class Meta:
        managed = False
        db_table = 'sahiplenen'


class Sponsor(models.Model):
    sponsor_id = models.IntegerField(primary_key=True, db_column='SponsorID', default=1)
    isim = models.CharField(max_length=255, blank=True, null=True, db_column='Isim')
    telefon = models.CharField(max_length=15, blank=True, null=True, db_column='Telefon')
    mail = models.CharField(max_length=100, blank=True, null=True, db_column='Mail')

    class Meta:
        managed = False
        db_table = 'sponsor'



class SponsorOldu(models.Model):
    sponsor_id = models.AutoField(primary_key=True, db_column='SponsorOlID')
    sp_sponsor = models.ForeignKey('Sponsor', on_delete=models.CASCADE, db_column='SpSponsorID')
    sp_hayvan = models.ForeignKey('Barinak', on_delete=models.CASCADE, db_column='SpBarinakID')
    bagis_miktari = models.DecimalField(max_digits=10, decimal_places=2, blank=True, null=True, db_column='BagisMiktari')

    class Meta:
        managed = False
        db_table = 'sponsor_oldu'
        unique_together = ('sp_sponsor', 'sp_hayvan')



class ZiyaretEdildi(models.Model):
    ziyaret_id = models.AutoField(primary_key=True, db_column='ZiyaretID')
    ziyaret_ziyaretci = models.ForeignKey('Ziyaretci', on_delete=models.CASCADE, db_column='ZiyaretZiyaretciID')
    ziyaret_barinak = models.ForeignKey('Barinak', on_delete=models.CASCADE, db_column='ZiyaretBarinakID')
    ziyaret_tarihi = models.DateField(blank=True, null=True, db_column='ZiyaretTarihi')

    class Meta:
        managed = False
        db_table = 'ziyaret_edildi'
        unique_together = ('ziyaret_ziyaretci', 'ziyaret_barinak')
    


class Ziyaretci(models.Model):
    ziyaretci_id = models.IntegerField(primary_key=True, db_column='ZiyaretciID')
    isim = models.CharField(max_length=255, blank=True, null=True, db_column='Ad')
    soyisim = models.CharField(max_length=255, blank=True, null=True, db_column='Soyad')
    telefon = models.CharField(max_length=15, blank=True, null=True, db_column='Telefon')
    mail = models.CharField(max_length=100, blank=True, null=True, db_column='Mail')

    class Meta:
        managed = False
        db_table = 'ziyaretci'




