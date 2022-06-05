import 'package:equatable/equatable.dart';


import 'package:flutter_application_9/Domain/Course.dart';


abstract class CourseState extends Equatable{
  @override
  // TODO: implement props
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

// enum course_status {initial,success,failure}
// class CourseState extends Equatable{
//   final course_status status;
//   final List<Course> courses;
//   final bool hasReachedMax;
//   const CourseState({
//     this.status = course_status.initial,
//     this.courses =const <Course>[],
//     this.hasReachedMax = false,

//   });
  

//   CourseState copyWith({
//     course_status? status,
//     List<Course>? courses,
//     bool? hasReachedMax,


//   }){
//   return CourseState(
//     status: status ?? this.status,
//     courses: courses ?? this.courses,
//     hasReachedMax: hasReachedMax ?? this.hasReachedMax
//   );
//   }
//     String toString() {
//     return '''CourseState { status: $status, hasReachedMax: $hasReachedMax, posts: ${courses.length} }''';
//   }


//   @override
//   // TODO: implement props
//   List<Object?> get props => [status,courses,hasReachedMax];} 