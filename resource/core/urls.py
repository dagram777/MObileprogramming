from django.urls import path
from rest_framework.routers import SimpleRouter

from core.serializers import StudentSerializer
from .views import MyAccountView, UserViewSet, SignupView, StudentViewSet

router=SimpleRouter()

router.register('users', UserViewSet, basename='users')
router.register('students',StudentViewSet, basename='students')

urlpatterns=router.urls


urlpatterns += [
        path('auth/signup', SignupView.as_view()),
         path('auth/my-account', MyAccountView.as_view())
]