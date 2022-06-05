import 'package:bloc/bloc.dart';
import 'package:flutter_application_9/Application/bloc/course_event.dart';
import 'package:flutter_application_9/Application/bloc/course_state.dart';

import 'package:http/http.dart' as http;
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_application_9/Infrastructure/course/courseRepoistory.dart';
// import 'package:stream_transform/stream_transform.dart';
const _postLimit = 20;
const throttleDuration = Duration(milliseconds: 100);

// EventTransformer<E> throttleDroppable<E>(Duration duration) {
//   return (events, mapper) {
//     return droppable<E>().call(events.throttle(duration), mapper);
//   };
// }
class CourseBloc extends Bloc<CourseEvent, CourseState> {
  CourseRepository courseRepository;
  CourseBloc(this.courseRepository) : super(CourseInitial()) {
  
   on<CourseFetched>(_onCourseFetched);
  //  transformer: throttleDroppable(throttleDuration),);
  
  }
 // final http.Client httpClient;

Future<void> _onCourseFetched(CourseFetched event,Emitter<CourseState> emit)async{
  //if(state.hasReachedMax) return;
  try{
    
      final courses = await courseRepository.getCourses();
     
      emit(CourseSuccess(courses));
    
  
  }catch(_){
    emit(CourseFailed());
  }

}

}
