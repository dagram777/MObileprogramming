from django.conf import settings
from django.contrib.auth.models import AbstractBaseUser,BaseUserManager
from django.db import models
from django.contrib.auth.models import PermissionsMixin

# Create your models here.
# class User(AbstractUser):
#    pass

class CustomeUserManager(BaseUserManager):
    def _create_user(self,username, email, password, is_active, is_staff, is_superuser,is_admin, **extra_fields):
        if not email:
            raise ValueError('User must have an email address')
        if not username:
            raise ValueError('User must have username')
        email=self.normalize_email(email)
            
        user=self.model(username=username,
            email=email, is_active=is_active, is_staff=is_staff, is_superuser=is_superuser,is_admin=is_admin, **extra_fields
        )
        user.set_password(password)
        user.save(using=self._db)
        return user
    def create_user(self, username, email, password, **extra_fields):
        return self._create_user(username, email, password, is_active=True, is_staff=False, is_superuser=False, is_admin=False, **extra_fields)
    def create_superuser(self,username, email, password, **extra_fields):
        return self._create_user(username,email, password, is_active=True, is_staff=True, is_superuser=True, is_admin=True, **extra_fields)
        
        

class CustomeUser(AbstractBaseUser, PermissionsMixin):
    email=models.EmailField(
        verbose_name='email address',
        max_length=255,
        unique=True
    )
    username=models.CharField(unique=True, verbose_name='username', max_length=255)
    #new 1 line below 
    password=models.CharField(max_length=255)
    is_active=models.BooleanField(default=True)
    is_admin=models.BooleanField(default=False)
    is_staff=models.BooleanField(default=False)
    is_superuser=models.BooleanField(default=False)
    

    objects=CustomeUserManager()
    USERNAME_FIELD='username'
    REQUIRED_FIELDS=['email' ,]

    

    def __str__(self):
        return self.username
class Student(models.Model):
  
     user =models.OneToOneField(CustomeUser,on_delete= models.CASCADE)
    