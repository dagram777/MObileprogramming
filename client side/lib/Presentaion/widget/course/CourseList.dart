// import 'package:flutter/material.dart';
// import 'package:flutter_application_9/Application/bloc/course_bloc.dart';
// import 'package:flutter_application_9/Application/bloc/course_event.dart';
// import 'package:flutter_application_9/Application/bloc/course_state.dart';
// import 'package:flutter_application_9/Domain/Course.dart';
// import 'package:flutter_application_9/Infrastructure/course/courseRepoistory.dart';


// import 'package:flutter_bloc/flutter_bloc.dart';

// import 'CourseListItem.dart';



// class CourseList extends StatefulWidget {
//   List<Course> course;
//   CourseList(this.course);

 
//   @override
//   _CourseListState createState() => _CourseListState(course);
// }

// class _CourseListState extends State<CourseList> {
//   String school;
//   _CourseListState(this.school);
//  // final _scrollController = ScrollController();

//   // @override
//   // void initState() {
//   //   super.initState();
//   //   _scrollController.addListener(_onScroll);
//   // }
 
//   @override
//   Widget build(BuildContext context) {
    
//     return BlocBuilder<CourseBloc, CourseState>(
//       builder: (context, state) {
//          print(state);
//         print(CourseRepositoryImpl().getCourses());
        
//         switch (state.status) {
          
//           case course_status.failure:
            
//             return const Center(child: Text('failed to fetch posts'));
//           // case state.courses.isEmpty:
            
//             // return ListView.builder(
//             //   itemBuilder: (BuildContext context, int index) {
//             //     return index >= state.courses.length
//             //         ? BottomLoader()
//             //         : CourseListItem(course:state.courses[index]);
//             //   },
//             //   itemCount: state.hasReachedMax
//             //       ? state.courses.length
//             //       : state.courses.length + 1,
//             //   controller: _scrollController,
//             // );
//           default:
//           if (state.courses.isEmpty) {
//               return const Center(child: Text('no posts'));
//             }final Course course;
//               return ListView.builder(
              
//               itemCount: state.courses.length,
//               itemBuilder: (BuildContext context, int index) {
                
//                 return CourseListItem(course:state.courses[index]);
//               },
//               // itemCount: state.hasReachedMax
//               //     ? state.courses.length
//               //     : state.courses.length + 1,
//               // controller: _scrollController,
//             );
           
              
//             // return const Text("N or post");
//         }
//       },
//     );
//   }

//   @override
//   void dispose() {
//     _scrollController
//       ..removeListener(_onScroll)
//       ..dispose();
//     super.dispose();
//   }

//   void _onScroll() {
//     if (_isBottom) context.read<CourseBloc>().add(CourseFetched());
//   }

//   bool get _isBottom {
//     if (!_scrollController.hasClients) return false;
//     final maxScroll = _scrollController.position.maxScrollExtent;
//     final currentScroll = _scrollController.offset;
//     return currentScroll >= (maxScroll * 0.9);
//   }
// }



 