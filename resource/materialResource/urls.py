
from cgitb import lookup
from django.urls import path
from django.views import View
from . import views
from rest_framework.routers import DefaultRouter
from rest_framework_nested import routers
router = routers.DefaultRouter()
router.register('materials',views.MaterialViewSet,basename='materials')
# router.register('students',views.StudentViewSet)

feedback_router = routers.NestedDefaultRouter(router, 'materials',lookup ='material' )

feedback_router.register('comment',views.CommentViewSet,basename='material-comment')


urlpatterns =router.urls + feedback_router.urls