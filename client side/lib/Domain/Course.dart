import 'dart:io';

import 'package:equatable/equatable.dart';

class Course extends Equatable{
  int id;
  String title;
 String pdf;
  String video;
 
 
  String years;
  String department;

  Course({
   required this.id,
   required this.title,
   required this.pdf,
   required this.video,

   required this.years,
   required this.department,

});
factory Course.fromJson(Map<String,dynamic> json){
  return Course(
    id: json['id'],
    title: json['title'],
    pdf : json['pdf'],
    video: json['video'],
 
    years:json['years'],
    department: json['department']

  );
  
}
  Map<String,dynamic> toJson()=>{
    'id' : id,
    'title':title,
    'pdf':pdf,
    'video':video,

    
    'years':years,
    'department':department
  };

  @override
  // TODO: implement props
  List<Object?> get props => [id,title,pdf,video,years,department];

}