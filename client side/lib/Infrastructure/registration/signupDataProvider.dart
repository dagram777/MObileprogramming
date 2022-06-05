import 'dart:convert';

import 'package:http/http.dart' as http;
final _baseUrl = 'http://127.0.0.1:8000/api';
class signupDataProvider{
 
Future<dynamic> SignUp(String username,String email,String password) async{
  final response = await http.post(Uri.parse(
    "$_baseUrl/v1/auth/signup"
    ),
     headers:<String,String>{
       'Content-Type':'application/json; charset=UTF-8',
     },
     body: jsonEncode(<String,String>{
       'username' : '$username',
       'email':"$email",
       'password' : '$password',

     }));
     if(response.statusCode == 200){
       return jsonDecode(response.body);
     }else{
       throw Exception("user Anauthenticate");
     }
}
}