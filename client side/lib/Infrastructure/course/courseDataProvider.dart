import 'dart:convert';

import 'package:flutter_application_9/Domain/Course.dart';
import 'package:http/http.dart' as http;

class CourseDataProvider {

  Future<List<Course>> getCourses([int startIndex = 0]) async{
    
    final response = await http.get(Uri.parse("http://127.0.0.1:8000/materialResource/materials/"));
    if(response.statusCode == 200){
      
    final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
    
  
   final  result = parsed.map<Course>((item)=> Course.fromJson(item)).toList();
    print(result.runtimeType);
 
   return result;
    }else{
      throw Exception("Can not load posts");
    }
  }


  Future<void> createCourse(Course course) async {
    final response = await http.post(
      Uri.parse("http://127.0.0.1:8000/materialResource/materials/"),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },

      body: jsonEncode(<String, String>{
        'title': course.title,
        'pdf':course.pdf,
        'video':course.video,
        'years': course.years,
        'department':course.department,
      }),
    ); 

    if (response.statusCode != 201){
      throw Exception('Failed to create User.');
    }

  }

  Future<void> updateCourse(Course course) async {
    final response = await http.put(
      Uri.parse("http://127.0.0.1:8000/materialResource/materials/"),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },

      body: jsonEncode(<String, String>{
        'title': course.title,
        'pdf':course.pdf,
        'video':course.video,
        'years': course.years,
        'department':course.department,
      }),
    ); 

    if (response.statusCode != 201){
      throw Exception('Failed to create User.');
    }

  }

  Future<void> deleteCourse(int id) async{
    final response = await http.delete(Uri.parse("http://127.0.0.1:8000/materialResource/materials/"),);
  }
}