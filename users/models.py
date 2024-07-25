from django.db import models

# Create your models here.

class Users(models.Model):
    email = models.EmailField(max_length=30)
    password = models.EmailField(max_length=20)

class Person(models.Model):
    first_name = models.CharField(max_length=30)
    last_name = models.CharField(max_length=30)

