import 'package:flutter/material.dart';
import 'package:flutter_application_9/Application/comment/bloc/comment_bloc.dart';
import 'package:flutter_application_9/Domain/Course.dart';
import 'package:flutter_application_9/Presentaion/State/AppState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class CommentScreen extends StatefulWidget {
  Course course;
  CommentScreen(this.course);
  State<CommentScreen> createState() => _courseDetailScreen(course);
}

class _courseDetailScreen extends State<CommentScreen> {
  Course course;
  _courseDetailScreen(this.course);
  @override
  Widget build(BuildContext context) {
    // var courses =
    //     Provider.of<SchoolAppState>(context, listen: false).selectedCourse;
    Color colors = Colors.orange.shade800;
    BoxDecoration decorate = BoxDecoration(
      color: colors,
      borderRadius: BorderRadius.circular(30),
    );
    return Scaffold(
        body: Column(children: [
            InkWell(
        child: Container(
          margin: const EdgeInsets.fromLTRB(5, 20, 0, 0),
          child: const Align(
            alignment: Alignment.topLeft,
            child: Icon(Icons.arrow_back, color: Colors.orange, size: 30),
          ),
        ),
        onTap: () => context.go('/courseList'),
            ),
            Container(
        width: 300,
        height: 150,
        margin: EdgeInsets.fromLTRB(10, 40, 10, 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: const DecorationImage(
                image: ExactAssetImage('assets/page3.jpg'), fit: BoxFit.fill)),
            ),
            Container(
        margin: EdgeInsets.all(20),
        child: Align(
          alignment: AlignmentDirectional.topStart,
          child: Text(course.title,
              style: TextStyle(
                  color: colors, fontSize: 24, fontWeight: FontWeight.w500)),
        ),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        Container(
          height: 35,
          width: 100, 
          padding: EdgeInsets.fromLTRB(20, 5, 20, 3),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: colors, width: 2)),
          child: Text("Material", style: TextStyle(color: colors)),
        ),
        SizedBox(width: 50),
        Container(
            height: 35,
            width: 100,
            padding: EdgeInsets.fromLTRB(20, 5, 10, 3),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: colors, width: 2),
            ),
            child: Text("Comment", style: TextStyle(color: colors)))
            ]),
            Container(
        child: BlocBuilder<CommentBloc, CommentState>(
        builder: (context, state) {
          if(state is CommentSuccess){
            return Text(state.comment[0].description);
            
            // ListView.builder(
            //   itemCount: state.comment.length,
            //   itemBuilder: (BuildContext context, int index){
            //     return ListTile(
            //       title: Text(state.comment[index].description, style: TextStyle(color: Colors.black),),
        
        
            //     );
        
            //   }
            //   );
          }
        
          return Container();
        },
            )),
          ]));
  }
}
