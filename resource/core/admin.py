from django.contrib import admin
from django.contrib.auth.admin import UserAdmin as BaseUserAdmin
from .models import CustomeUser, Student
from django import forms
from django.contrib.auth.models import Group
from django.contrib.auth.forms import ReadOnlyPasswordHashField
# Register your models here.

class UserCreationForm(forms.ModelForm):
    password = forms.CharField(label='Password', widget=forms.PasswordInput)
   

    class Meta:
        model = CustomeUser
        fields = ('email','username')

    def clean_password(self):
        # Check that the two password entries match
        password = self.cleaned_data.get("password")
        # password2 = self.cleaned_data.get("password2")
        if not password :
            raise forms.ValidationError("Password is not valid")
        return password

    def save(self, commit=True):
        # Save the provided password in hashed format
        user = super().save(commit=False)
        user.set_password(self.cleaned_data["password"])
        if commit:
            user.save()
        return user


class UserChangeForm(forms.ModelForm):

    password = ReadOnlyPasswordHashField()

    class Meta:
        model = CustomeUser
        fields = ('email','username', 'password',  'is_active', 'is_admin')


class UserAdmin(BaseUserAdmin) :

    form = UserChangeForm
    add_form = UserCreationForm
    list_display = ('email','username', 'is_admin')
    list_filter = ('is_admin',)
    fieldsets = (
        (None,{'fields':('email','username','password')}),
        ('Permissions',{'fields':('is_admin',)}),
    )
    add_fieldsets = (
        (
            None,
            {
                "classes": ("wide",),
                "fields": ("username", "password","email"),
            },
        ),
    
    )
admin.site.register(CustomeUser,UserAdmin)
admin.site.register(Student)
admin.site.unregister(Group)