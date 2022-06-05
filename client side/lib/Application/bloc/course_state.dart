import 'package:equatable/equatable.dart';


import 'package:flutter_application_9/Domain/Course.dart';


abstract class CourseState extends Equatable{
  @override
  
  List<Object?> get props => throw UnimplementedError();

}


class CourseSuccess extends CourseState{
  List<Course> course;
  CourseSuccess(this.course);
}

class CourseFailed extends CourseState{}

class CourseInitial extends CourseState{}

class CourseLoading extends CourseState{}

class CourseCreated extends CourseState{}

class CourseUpdated extends CourseState{}

class CourseDeleted extends CourseState{}

