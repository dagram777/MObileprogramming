from django.http import HttpResponse
from django.shortcuts import get_object_or_404, render
from rest_framework.decorators import api_view
from rest_framework.response import Response
from materialResource import serializer
from rest_framework import status

from rest_framework import viewsets
from django_filters.rest_framework import DjangoFilterBackend
from rest_framework.filters import SearchFilter
from rest_framework.filters import OrderingFilter
from rest_framework.viewsets import ModelViewSet, GenericViewSet
# from materialResource.filter import Materialfilter
from rest_framework.mixins import CreateModelMixin,RetrieveModelMixin,UpdateModelMixin

from materialResource.models import FeedBack, Course
from materialResource.serializer import CommentSerializer, MaterialSerializer

# Create your views here.

class MaterialViewSet(ModelViewSet):
    queryset = Course.objects.all()
    serializer_class = MaterialSerializer
    # filter_backends = [DjangoFilterBackend,SearchFilter,OrderingFilter]
    # filterset_class = Materialfilter
    search_fields = ['title']
    ordering_fields = ['uploaded_date']

    # def delete(self, request, pk):
    #     product = get_object_or_404(Course, pk=pk)

    #     product.delete()
    #     return Response(status=status.HTTP_204_NO_CONTENT)
    # def get_queryset(self):
        
    #     return Course.objects.filter(user_id = self.kwargs['user_id'])


    # def get_serializer_context(self):
    #     return {'user_id':self.kwargs['user_id']}
   
class CommentViewSet(ModelViewSet):  
    
    serializer_class = CommentSerializer
    def get_queryset(self):
        
        return FeedBack.objects.filter(material_id = self.kwargs['material_pk'])


    def get_serializer_context(self):
        return {'material_id':self.kwargs['material_pk']}
# class StudentViewSet(CreateModelMixin,RetrieveModelMixin,UpdateModelMixin):
#     queryset = Student.objects.all()
#     serializer_class = StudentSerializer
