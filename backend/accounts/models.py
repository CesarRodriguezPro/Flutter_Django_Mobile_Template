from django.db import models
from django.contrib.auth.models import AbstractUser


class User(AbstractUser):

    # Personal Information.
    profile_picture = models.ImageField(default='default.jpg', upload_to='profile_pics', null=True, blank=True)
    location = models.ForeignKey(Locations, on_delete=models.CASCADE, null=True, blank=True)
    telephone = models.CharField(max_length=20, null=True, blank=True)

    def __str__(self):
        if self.first_name and self.last_name:
            return f'{self.username} | {self.first_name} {self.last_name}'
        else:
            return f"{self.username}"


