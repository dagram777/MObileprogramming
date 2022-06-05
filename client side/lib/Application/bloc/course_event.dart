import 'package:equatable/equatable.dart';
abstract class CourseEvent extends Equatable{
  List<Object> get props => [];
}

class CourseFetched extends CourseEvent{}
class CourseCreate extends CourseEvent{
  int id;
  String title;
  String pdf;
  String video; 
  String years;
  String department;
  CourseCreate(this.id,this.title,this.pdf,this.video,this.years,this.department);
}


class CourseUpdate extends CourseEvent{
   int id;
  String title;
  String pdf;
  String video; 
  String years;
  String department;
  CourseUpdate(this.id,this.title,this.pdf,this.video,this.years,this.department);
}

class CourseDelete extends CourseEvent{
  int id;
  CourseDelete(this.id);
}


