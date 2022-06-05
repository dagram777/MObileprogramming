from xml.etree.ElementTree import Comment
from rest_framework import serializers
from django.contrib.auth import authenticate
from django.contrib.auth.models import update_last_login
from rest_framework.mixins import CreateModelMixin,RetrieveModelMixin,UpdateModelMixin
from rest_framework import serializers
# from rest_framework_simplejwt.tokens import RefreshToken

from materialResource.models import *
from core.serializers import StudentSerializer

class MaterialSerializer(serializers.ModelSerializer):

    student = StudentSerializer
    class Meta:
        model = Course
        fields = ['id','title','pdf','video','uploaded_date','years','department','student']

    # def create(self, validated_data):
    #     user_id = self.context['user_id']

    #     return Course.objects.create(user_id = user_id,**validated_data)

class CommentSerializer(serializers.ModelSerializer):
    
    class Meta:
        model = FeedBack
        fields =['description']

    def create(self, validated_data):
        material_id = self.context['material_id']

        return FeedBack.objects.create(material_id = material_id,**validated_data)

# class StudentSerializer(serializers.ModelSerializer):
#     class Meta:
#         model = Student
#         fields = ['id','user_id']



# class UserRegistrationSerializer(serializers.ModelSerializer):
#     class Meta:
#         model = User
#         fields = (
#             'name',
#             'email',
#             'password',
            
#         )

#     def create(self, validated_data):
#         auth_user = User.objects.create_user(**validated_data)
#         return auth_user

# class UserLoginSerializer(serializers.Serializer):
#     email = serializers.EmailField()
#     password = serializers.CharField(max_length=128, write_only=True)
#     access = serializers.CharField(read_only=True)
#     refresh = serializers.CharField(read_only=True)
#     role = serializers.CharField(read_only=True)

#     def create(self, validated_date):
#         pass

#     def update(self, instance, validated_data):
#         pass

#     def validate(self, data):
#         email = data['email']
#         password = data['password']
#         user = authenticate(email=email, password=password)

#         if user is None:
#             raise serializers.ValidationError("Invalid login credentials")

#         try:
#             refresh = RefreshToken.for_user(user)
#             refresh_token = str(refresh)
#             access_token = str(refresh.access_token)

#             update_last_login(None, user)

#             validation = {
#                 'access': access_token,
#                 'refresh': refresh_token,
#                 'email': user.email,
#                 # 'full_name': user.get_full_name(),
#                 'role': user.role,
#             }

#             return validation
#         except user.DoesNotExist:
#             raise serializers.ValidationError("Invalid login credentials")

# class UserListSerializer(serializers.ModelSerializer):
#     class Meta:
#         model = User
#         fields = (
#             'id',
#             'email',
#             'name'
#         )