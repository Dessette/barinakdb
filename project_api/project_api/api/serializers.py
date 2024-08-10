from rest_framework import serializers
from .models import Barinak, Hayvan, Ilgilenir, Personel, Sahiplenen, Sponsor, SponsorOldu, ZiyaretEdildi, Ziyaretci

class BarinakSerializer(serializers.ModelSerializer):
    class Meta:
        model = Barinak
        fields = '__all__'

class HayvanSerializer(serializers.ModelSerializer):
    class Meta:
        model = Hayvan
        fields = '__all__'

class IlgilenirSerializer(serializers.ModelSerializer):
    class Meta:
        model = Ilgilenir
        fields = '__all__'

class PersonelSerializer(serializers.ModelSerializer):
    class Meta:
        model = Personel
        fields = '__all__'

class SahiplenenSerializer(serializers.ModelSerializer):
    class Meta:
        model = Sahiplenen
        fields = '__all__'

class SponsorSerializer(serializers.ModelSerializer):
    class Meta:
        model = Sponsor
        fields = '__all__'

class SponsorOlduSerializer(serializers.ModelSerializer):
    class Meta:
        model = SponsorOldu
        fields = '__all__'

class ZiyaretEdildiSerializer(serializers.ModelSerializer):
    class Meta:
        model = ZiyaretEdildi
        fields = '__all__'

class ZiyaretciSerializer(serializers.ModelSerializer):
    class Meta:
        model = Ziyaretci
        fields = '__all__'
