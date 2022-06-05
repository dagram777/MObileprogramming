
import email
from trace import Trace
from django.conf import settings
from django.db import models

from core.models import Student
# from django.contrib.auth.models import User

# import uuid

# from django.db import models
# from django.contrib.auth.models import PermissionsMixin
# from django.contrib.auth.base_user import AbstractBaseUser
# from django.utils import timezone

# from .managers import CustomUserManager
# class Student(models.Model):
#      user_name = models.CharField(max_length=255)
#      email = models.EmailField(max_length=255)
#      user =models.OneToOneField(settings.AUTH_USER_MODEL,on_delete= models.CASCADE)
#      def __str__(self):
#          return f'{self.user.first_name}{self.user.last_name}'

#      def first_name(self):
#         return self.user.first_name
#      def last_name(self):
#          return self.user.last_name


class Course(models.Model):
    FIRST_YEAR ='1'
    SECOND_YEAR = '2'
    THIRD_YEAR = '3' 
    FOURTH_YEAR ='4'
    FIFTH_YEAR ='5' 

    MECHANICAL = 'School of Mechanical Engineering'
    SOFTWARE = 'School of Software Engineering'
    CIVIL ='School of Civil Engineering'
    BIOMEDICAL = 'School of Biomedical Engineering'
    ELECTRICAL = 'School of Electrical Engineering'
    CHEMICAL = 'School of Chemical Engineering'

    YEARS_CHOICES = [
      (FIRST_YEAR,'First Year'),
      (SECOND_YEAR,'Second Year'),
      (THIRD_YEAR ,'Third Year'),
      (FOURTH_YEAR, 'Fourth Year'),
       (FIFTH_YEAR,'FiFth Year'),

    ]
    DEPARTMENT_CHOICES = [
        (MECHANICAL,'Mechanical Engineering'),
        (SOFTWARE,'Software Engineering'),
        (CIVIL,'civil Engineering'),
        (BIOMEDICAL,'Biomedical Engineering'),
        (ELECTRICAL,'Electrical Engineering'),
        (CHEMICAL,'Chemical Engineering')

    ]
    title = models.CharField(max_length=255)
    pdf = models.FileField(null = True)
    video = models.FileField(null = True)
    uploaded_date = models.DateTimeField(auto_now=True)
    years = models.CharField(max_length=1,choices=YEARS_CHOICES)
    department = models.CharField(max_length =255 , choices = DEPARTMENT_CHOICES,default=None)
    student =models.ForeignKey(Student,on_delete= models.CASCADE)
   
     
    def __str__(self) -> str:
         return self.title


class FeedBack(models.Model):
    description = models.TextField(null = False)
    material = models.ForeignKey(Course,on_delete = models.CASCADE, related_name='comment')
    student =models.ForeignKey(Student,on_delete= models.CASCADE)
    def __str__(self) -> str:
         return self.description

# class User(AbstractBaseUser, PermissionsMixin):

#     # These fields tie to the roles!
#     ADMIN = 1
#     TEACHER = 2
#     STUDENT = 3

#     ROLE_CHOICES = (
#          (ADMIN, 'Admin'),
#          (TEACHER, 'Teacher'),
#         (STUDENT, 'Student')
#     )

#     class Meta:
#         verbose_name = 'user'
#         verbose_name_plural = 'users'

#     uid = models.UUIDField(unique=True, editable=False, default=uuid.uuid4, verbose_name='Public identifier')
#     email = models.EmailField(unique=True)
#     name = models.CharField(max_length=30, blank=True)
#     last_name = models.CharField(max_length=50, blank=True)
#     role = models.PositiveSmallIntegerField(choices=ROLE_CHOICES, blank=True, null=True, default=3)
#     date_joined = models.DateTimeField(auto_now_add=True)
#     is_staff = models.BooleanField(default=False)
#     is_superuser = models.BooleanField(default=False)
    
#     is_deleted = models.BooleanField(default=False)
#     created_date = models.DateTimeField(default=timezone.now)
#     modified_date = models.DateTimeField(default=timezone.now)
#     created_by = models.EmailField()
#     modified_by = models.EmailField()

#     USERNAME_FIELD = 'email'
#     REQUIRED_FIELDS = []

#     objects = CustomUserManager()

#     def __str__(self):
#         return self.email
