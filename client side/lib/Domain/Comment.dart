import 'package:equatable/equatable.dart';
import 'package:flutter_application_9/Domain/Course.dart';

class Comment extends Equatable{
  // Course course;
  String description;

  Comment({
   
    required this.description,

  });
factory Comment.fromJson(Map<String,dynamic> json){
  return Comment( description: json['description']);
  
}
  Map<String,dynamic> toJson()=>{
    
  
    'description':description,
    
  };

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
  
}
