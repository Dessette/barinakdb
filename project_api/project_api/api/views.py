from rest_framework.response import Response
from rest_framework.decorators import api_view
from .models import Barinak, Hayvan, Ilgilenir, Personel, Sahiplenen, Sponsor, SponsorOldu, ZiyaretEdildi, Ziyaretci
from .serializers import BarinakSerializer, HayvanSerializer, IlgilenirSerializer, PersonelSerializer, SahiplenenSerializer, SponsorSerializer, SponsorOlduSerializer, ZiyaretEdildiSerializer, ZiyaretciSerializer
from rest_framework import status

@api_view(['GET'])
def barinak_list(request):
    barinaklar = Barinak.objects.all()
    serializer = BarinakSerializer(barinaklar, many=True)
    return Response(serializer.data)

@api_view(['POST'])
def barinak_add(request):
    serializer = BarinakSerializer(data=request.data)
    print(request.data)
    if serializer.is_valid():
        serializer.save()
        print(serializer.errors)
        return Response(serializer.data, status=status.HTTP_201_CREATED)
    return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

@api_view(['DELETE'])
def barinak_delete(request, pk):
    try:
        barinak = Barinak.objects.get(pk=pk)
    except Barinak.DoesNotExist:
        return Response(status=status.HTTP_404_NOT_FOUND)

    barinak.delete()
    return Response(status=status.HTTP_204_NO_CONTENT)


@api_view(['GET'])
def hayvan_list_by_barinak(request, barinak_id):
    hayvanlar = Hayvan.objects.filter(barinak_id=barinak_id)
    serializer = HayvanSerializer(hayvanlar, many=True)
    return Response(serializer.data)


@api_view(['GET'])
def hayvan_list(request):
    hayvanlar = Hayvan.objects.all()
    serializer = HayvanSerializer(hayvanlar, many=True)
    return Response(serializer.data)

@api_view(['POST'])
def hayvan_add(request):
    serializer = HayvanSerializer(data=request.data)
    print(request.data)
    if serializer.is_valid():
        serializer.save()
        print(serializer.errors)
        return Response(serializer.data, status=status.HTTP_201_CREATED)
    return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

@api_view(['DELETE'])
def hayvan_delete(request, hayvan_id):
    try:
        hayvan = Hayvan.objects.get(pk=hayvan_id)
        hayvan.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)
    except Hayvan.DoesNotExist:
        return Response(status=status.HTTP_404_NOT_FOUND)


@api_view(['GET'])
def ilgilenir_list(request):
    ilgilenenler = Ilgilenir.objects.all()
    serializer = IlgilenirSerializer(ilgilenenler, many=True)
    return Response(serializer.data)



@api_view(['GET'])
def personel_list(request):
    personeller = Personel.objects.all()
    serializer = PersonelSerializer(personeller, many=True)
    return Response(serializer.data)

@api_view(['POST'])
def personel_add(request):
    serializer = PersonelSerializer(data=request.data)
    if serializer.is_valid():
        serializer.save()
        return Response(serializer.data, status=status.HTTP_201_CREATED)
    return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

@api_view(['DELETE'])
def personel_delete(request, personel_id):
    try:
        personel = Personel.objects.get(pk=personel_id)
        personel.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)
    except Personel.DoesNotExist:
        return Response(status=status.HTTP_404_NOT_FOUND)





@api_view(['GET'])
def sahiplenen_list(request):
    sahiplenenler = Sahiplenen.objects.select_related('hayvan').all()
    serialized_data = []

    for sahiplenen in sahiplenenler:
        serialized_data.append({
            'sahiplenme_id': sahiplenen.sahiplenme_id,
            'isim': sahiplenen.isim,
            'soyisim': sahiplenen.soyisim,
            'telefon': sahiplenen.telefon,
            'mail': sahiplenen.mail,
            'hayvan': {
                'hayvan_id': sahiplenen.hayvan.hayvan_id,
                'isim': sahiplenen.hayvan.isim,
                'tur': sahiplenen.hayvan.tur,
                'cins': sahiplenen.hayvan.cins,
                'cinsiyet': sahiplenen.hayvan.cinsiyet,
                'yas': sahiplenen.hayvan.yas,
                'saglik_durumu': sahiplenen.hayvan.saglik_durumu,
                'sahiplenme_durum': sahiplenen.hayvan.sahiplenme_durum,
                'giris_tarihi': sahiplenen.hayvan.giris_tarihi,
                'barinak': sahiplenen.hayvan.barinak.isim
            }
        })

    return Response(serialized_data)

@api_view(['POST'])
def sahiplenen_add(request):
    serializer = SahiplenenSerializer(data=request.data)
    print(request.data)
    if serializer.is_valid():
        serializer.save()
        print(serializer.errors)
        return Response(serializer.data, status=status.HTTP_201_CREATED)
    return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

@api_view(['DELETE'])
def sahiplenen_delete(request, sahiplenme_id):
    try:
        sahiplenen = Sahiplenen.objects.get(pk=sahiplenme_id)
        sahiplenen.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)
    except Sahiplenen.DoesNotExist:
        return Response(status=status.HTTP_404_NOT_FOUND)



@api_view(['GET'])
def sponsor_list(request):
    sponsor_oldu = SponsorOldu.objects.select_related('sp_sponsor', 'sp_hayvan').all()
    sponsor_data = []
    
    for item in sponsor_oldu:
        sponsor_info = {
            "sponsor_id": item.sp_sponsor.sponsor_id,
            "isim": item.sp_sponsor.isim,
            "telefon": item.sp_sponsor.telefon,
            "mail": item.sp_sponsor.mail,
            "barinak_isim": item.sp_hayvan.isim,
            "bagis_miktari": item.bagis_miktari
        }
        sponsor_data.append(sponsor_info)

    return Response(sponsor_data)

@api_view(['POST'])
def sponsor_add(request):
    serializer = SponsorSerializer(data=request.data)
    if serializer.is_valid():
        serializer.save()
        return Response(serializer.data, status=status.HTTP_201_CREATED)
    return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

@api_view(['DELETE'])
def sponsor_delete(request, sponsor_id):
    try:
        sponsor = Sponsor.objects.get(pk=sponsor_id)
        sponsor.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)
    except Sponsor.DoesNotExist:
        return Response(status=status.HTTP_404_NOT_FOUND)



@api_view(['GET'])
def sponsor_oldu_list(request):
    sponsor_oldu = SponsorOldu.objects.all()
    serializer = SponsorOlduSerializer(sponsor_oldu, many=True)
    return Response(serializer.data)

@api_view(['GET'])
def ziyaret_edildi_list(request):
    ziyaret_edildi = ZiyaretEdildi.objects.all()
    serializer = ZiyaretEdildiSerializer(ziyaret_edildi, many=True)
    return Response(serializer.data)



@api_view(['GET'])
def ziyaretci_list(request):
    ziyaretciler = Ziyaretci.objects.all()
    serializer = ZiyaretciSerializer(ziyaretciler, many=True)
    return Response(serializer.data)

@api_view(['POST'])
def ziyaretci_add(request):
    print(request.data)  # Bu satırı ekleyin
    serializer = ZiyaretciSerializer(data=request.data)
    if serializer.is_valid():
        serializer.save()
        return Response(serializer.data, status=status.HTTP_201_CREATED)
    return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

@api_view(['DELETE'])
def ziyaretci_delete(request, ziyaretci_id):
    try:
        ziyaretci = Ziyaretci.objects.get(pk=ziyaretci_id)
        ziyaretci.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)
    except Ziyaretci.DoesNotExist:
        return Response(status=status.HTTP_404_NOT_FOUND)
