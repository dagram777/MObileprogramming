
from rest_framework import serializers
from django.contrib.auth import get_user_model,authenticate
from django.contrib.auth.models import update_last_login
from core.models import CustomeUser, Student
from rest_framework_simplejwt.tokens import RefreshToken
from django.utils.translation import gettext_lazy as _


class RegisterSerializer(serializers.Serializer): 
	username=serializers.CharField(required=True)
	email = serializers.EmailField(required =True)
	password = serializers.CharField()
	# first_name = serializers.CharField(required=False, write_only=False)
	# middle_name=serializers.CharField(required=False, write_only=False)
	# last_name = serializers.CharField(required=False, write_only=False)


    # def validate_emial(self,email):
	# 	email = get_adapter().clean_email(email)
	# 	if allauth_settings.UNIQUE_EMAIL:
	# 		if email and email_address_exists(email):
	# 			raise serializers.ValidationError("Email already exists")
	# 	return email
 

	def create(self, cleaned_data):
		user = CustomeUser.objects.create_user(
				username=cleaned_data.get("username"),
				email=cleaned_data.get("email"),
				password=cleaned_data.get("password")
			)
		student = Student(
				user=user,
				# first_name=cleaned_data.get("first_name"),
				# middle_name=cleaned_data.get("middle_name"),
				# last_name=cleaned_data.get("last_name"),

			)
		student.save()
		return student
class UserDetailsSerializer(serializers.ModelSerializer):
	class Meta:
		model=get_user_model()
		fields=('pk', 'username', 'email')
		read_only_fields=('email',)


class StudentSerializer(serializers.ModelSerializer):

	user = UserDetailsSerializer()

	class Meta:
		model=Student
		fields= "__all__"


# class UserLoginSerializer(serializers.Serializer):
#     username = serializers.CharField()
#     password = serializers.CharField(max_length=128, write_only=True)
#     access = serializers.CharField(read_only=True)
  
#     def validate(self, data):
#         username = data.get('username')
#         password = data.get('password')

#         if username and password:
#             user = authenticate(request=self.context.get('request'),
#                                 username=username, password=password)
#             if not user:
#                 msg = _('Unable to log in with provided credentials.')
#                 raise serializers.ValidationError(msg, code='authorization')
#         else:
#             msg = _('Must include "username" and "password".')
#             raise serializers.ValidationError(msg, code='authorization')

#         data['user'] = user
#         return data
	
