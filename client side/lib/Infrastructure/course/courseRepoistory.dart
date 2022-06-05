

import 'package:flutter/cupertino.dart';
import 'package:flutter_application_9/Domain/Course.dart';
import 'package:flutter_application_9/Infrastructure/course/courseDataProvider.dart';



import 'package:http/http.dart' as http;
import 'dart:convert';

class CourseRepository{
  CourseDataProvider courseDataProvider;
  CourseRepository(this.courseDataProvider);

  Future<List<Course>> getCourses() async{
    return await courseDataProvider.getCourses();
  }

  Future<void> createCourse(Course course) async{
    return await courseDataProvider.createCourse(course);
  }

  Future<void> updateCourse(Course course) async{
    return await courseDataProvider.updateCourse(course);
  }

  Future<void> deleteCourse(int id) async{
    return await courseDataProvider.deleteCourse(id);
  }








}

  // @override
  // Future<void> Createcourse(Course co) async {
  //   final titleController = TextEditingController();
  //   final depController = TextEditingController();
  //   final YearController = TextEditingController();
  //   var url = 'http://127.0.0.1:8000/materialResource/materials/';
    
  // // var data =  Course(
  // //      title:titleController,
  // //      pdf: "fikir",
  // //      video:  "fikir", 
      
  // //      years: "fikir", 
  // //      department: "fikir",
  // //       );
     
  //   //  var  response = await http.post(Uri.parse("http://127.0.0.1:8000/materialResource/materials/"),body:jsonEncode(data) );
 
  //   // TODO: implement Createcourse
  //   throw UnimplementedError();
  // }
    
  // }
  

  
  


