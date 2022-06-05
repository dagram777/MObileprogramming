import 'dart:convert';

import '../../Domain/Comment.dart';
import 'package:http/http.dart' as http;


final _baseUrl = "http://127.0.0.1:8000/materialResource/materials";

class CommentDataProvider{
  Future<List<Comment>> getComment(int id) async{
    final response = await http.get(Uri.parse('$_baseUrl/$id/comment'));

    if(response.statusCode == 200){
      final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
    
  
      final  result = parsed.map<Comment>((item)=> Comment.fromJson(item)).toList();

      return result;

    }else{
      return throw Exception("failed to get comments");
    }


  }
  // Future<void> Createcourse();

  Future<void> comment(String comment,int id) async {
    final response = await http.post(
      Uri.parse("$_baseUrl/$id/comment"),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },

      body: jsonEncode(<String, String>{
        'description': comment,
      }),
    ); 

    if (response.statusCode != 201){
      throw Exception('Failed to create User.');
    }

  }

  Future<void> updateComment(String newComment,int id) async {
    final response = await http.put(
      Uri.parse("$_baseUrl/$id/comment"),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },

      body: jsonEncode(<String, String>{
        'description': newComment,
      }),
    ); 

    if (response.statusCode != 201){
      throw Exception('Failed to create User.');
    }

  }

  Future<void> deleteComment(int id) async{
    final response = await http.delete(Uri.parse("$_baseUrl/$id/comment"),);
  }

}