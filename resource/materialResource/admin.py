from django.contrib import admin

from materialResource import models

# @admin.display(models.Student)
# class StudentAdmin(admin.ModelAdmin):
#     list_display = ['first_name','last_name']
#     list_select_related =['user']

# Register your models here.
admin.site.register(models.Course)
admin.site.register(models.FeedBack)
# admin.site.register(models.Student)