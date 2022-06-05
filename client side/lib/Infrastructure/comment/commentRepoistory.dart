import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application_9/Domain/Comment.dart';
import 'package:flutter_application_9/Infrastructure/comment/commentDataProvider.dart';
import 'package:http/http.dart' as http;

class CommentRepository {
  CommentDataProvider commentDataProvider;
  CommentRepository( this.commentDataProvider);

  Future<List<Comment>> getComment(int id) async{
    return await commentDataProvider.getComment(id);
  }

  Future<void> comment(String comment, int id) async{
    return await commentDataProvider.comment(comment, id);
  }

  Future<void> updateComment(String comment, int id) async{
    return await commentDataProvider.updateComment(comment, id);
  }

  Future<void> delete(int id) async{
    return await commentDataProvider.deleteComment(id);
  }
  
}









// class CommentRepository implements CommentDataProvider{
//    Future<List<Comment>> getComment([int startIndex = 0]) async{
    
//     final response = await http.get(Uri.parse("http://127.0.0.1:8000/materialResource/materials/1/comment/"));
//     if(response.statusCode == 200){
      
//     final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
    
  
//    final  result = parsed.map<Comment>((item)=> Comment.fromJson(item)).toList();
//     print(result.runtimeType);
 
//    return result;
//     }else{
//       throw Exception("Can not load posts");
//     }
//   }

// }