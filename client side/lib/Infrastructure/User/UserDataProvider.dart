import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter_application_9/Domain/Student.dart';
import 'package:http/http.dart' as http;
class UserDataProvider{
  final _baseUrl = 'http://127.0.0.1:8000/api';

    Future<void> signUp(Student user) async {
    final response = await http.post(
      Uri.parse("$_baseUrl/v1/auth/signup"),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },

      body: jsonEncode(<String, dynamic>{
        'username':user.username,
        'email': user.email,
        'password':user.password,
      }),
    ); 

    if (response.statusCode != 201){
      throw Exception('Failed to create User.');
    }

  }


  Future<String> logIn(Student user) async {
    final response = await http.post(
      Uri.parse("$_baseUrl/v1/auth/login/"),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },

      body: jsonEncode(<String, dynamic>{
        'username':user.username,
        
        'password': user.password,
      }),
    );   
    

    
    if (response.statusCode == 200){
      print("hi");
      return jsonDecode(response.body);
    }else{
      throw Exception("user Anauthenticated fail ");
    }

  }
  

  



}