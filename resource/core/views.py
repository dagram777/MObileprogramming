from rest_framework import permissions 
from rest_framework.permissions import AllowAny,IsAuthenticated 
from .serializers import StudentSerializer, UserDetailsSerializer,RegisterSerializer
from rest_framework.response import Response
from django.contrib.auth import get_user_model
from rest_framework import viewsets
from rest_framework.views import APIView
from rest_framework.authtoken.models import Token
from rest_framework.viewsets import ModelViewSet, GenericViewSet
from rest_framework.mixins import CreateModelMixin,UpdateModelMixin
from .models import CustomeUser, Student
from rest_framework import generics, status
from rest_framework.response import Response
from django.contrib.auth.models import update_last_login
from django.core.exceptions import PermissionDenied
from rest_framework_simplejwt.tokens import RefreshToken
class UserViewSet(viewsets.ModelViewSet):
	queryset=get_user_model().objects.all()
	serializer_class=UserDetailsSerializer
	permission_classes=[permissions.IsAdminUser]



class StudentViewSet(ModelViewSet):
	queryset=Student.objects.all()
	serializer_class=StudentSerializer
	permission_classes=[permissions.IsAuthenticated]

	def list(self, request):

		if(request.user.is_admin):
			return super().list(request)

		instance = Student.objects.get(user=request.user)
		return Response(
				self.serializer_class(instance).data
			)

class SignupView(APIView):
	
   
	def __serialize_token(self,token):
		return{
			"refresh":str(token),
			"access":str(token.access_token)
		}
	def post(self, request):
		print(request.data)
		serializer = RegisterSerializer(data=request.data)
		serializer.is_valid(raise_exception=True)
		Student = serializer.save()
		
		return Response(
					{
						"token": self.__serialize_token(RefreshToken.for_user(Student.user)),
						"client": StudentSerializer(Student).data
					},
					status=status.HTTP_201_CREATED
				)
		#return Response(data=serializer.data, status=status.HTTP_201_CREATED)
class MyAccountView(APIView):

	
	def get(self, request):
		print(request.user)
		if not request.user.is_authenticated:
			raise PermissionDenied()
		
		instance = Student.objects.get(user=request.user)
		return Response(
				StudentSerializer(instance=instance).data
			)
# class AuthUserLoginView(APIView):

#     # serializer_class = UserLoginSerializer
#     # permission_classes = (AllowAny, )


# 	 def post(self, request, *args, **kwargs):
#           serializer = UserLoginSerializer(data=request.data, context={'request': request})
#           serializer.is_valid(raise_exception=True)
#           user = serializer.validated_data['user']
#         #   update_last_login(None, user)
#           token, created = Token.objects.get_or_create(user=user)
#           return Response({"status": status.HTTP_200_OK, "Token": token.key})

    # def post(self, request):
    #     serializer = self.serializer_class(data=request.data)
    #     valid = serializer.is_valid(raise_exception=True)

    #     if valid:
    #         status_code = status.HTTP_200_OK

    #         response = {
    #             'success': True,
    #             'statusCode': status_code,
    #             'message': 'User logged in successfully',
    #             'access': serializer.data['access'],
    #             'refresh': serializer.data['refresh'],
    #             'authenticatedUser': {
    #                 'email': serializer.data['email'],
    #                 # 'id': serializer.data['id']
    #             }
    #         }

    #         return Response(response, status=status_code)



