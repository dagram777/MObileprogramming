import 'package:bloc/bloc.dart';
import 'package:flutter_application_9/Application/bloc/course_event.dart';
import 'package:flutter_application_9/Application/bloc/course_state.dart';

import 'package:http/http.dart' as http;
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_application_9/Infrastructure/course/courseRepoistory.dart';

const _postLimit = 20;
const throttleDuration = Duration(milliseconds: 100);

class CourseBloc extends Bloc<CourseEvent, CourseState> {
  CourseRepository courseRepository;
  CourseBloc(this.courseRepository) : super(CourseInitial()) {
  
    on<CourseFetched>(_onCourseFetched);
    on<CourseCreate>(_oncourseCreate);
    on<CourseUpdate>(_oncourseUpdate);
    on<CourseDelete>(_oncourseDelete);
  
  
  }


Future<void> _onCourseFetched(CourseFetched event,Emitter<CourseState> emit)async{

  try{
    
      final courses = await courseRepository.getCourses();
     
      emit(CourseSuccess(courses));
    
  
  }catch(_){
    emit(CourseFailed());
  }

}
Future<void> _oncourseCreate(CourseCreate event,Emitter<CourseState> emit)async{
    try {
      final response = await courseRepository.createCourse(event.department,event.id,event.pdf,event.title,event.video,event.years);
      emit(CourseCreated());
      
    } catch (e) {
      emit(CourseFailed());
    }

  }

  Future<void> _oncourseUpdate(CourseUpdate event,Emitter<CourseState> emit)async{
    try {
      final response = await courseRepository.updateCourse(event.department,event.id,event.pdf,event.title,event.video,event.years);
      emit(CourseUpdated());
      
    } catch (e) {
      emit(CourseFailed());
    }

  }

  Future<void> _oncourseDelete(CourseDelete event,Emitter<CourseState> emit)async{
    try {
      final response = await courseRepository.deleteCourse(event.id);
      emit(CourseDeleted());
      
    } catch (e) {
      emit(CourseFailed());
    }

  }


}

