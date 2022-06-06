
import 'package:flutter/material.dart';
import 'package:flutter_application_9/Application/comment/bloc/comment_bloc.dart';

import 'package:flutter_application_9/Domain/Course.dart';
import 'package:flutter_application_9/Presentaion/State/AppState.dart';
import 'package:flutter_application_9/Presentaion/widget/course/CourseDetail.dart';
import 'package:flutter_application_9/Presentaion/widget/course/CourseDetialsScreen.dart';
import 'package:flutter_application_9/Presentaion/widget/course/commentScreen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';


class CourseListItem extends StatelessWidget{

  const CourseListItem(this.course);

  final Course course;

  @override
  Widget build(BuildContext context) {
    // var appState = Provider.of<SchoolAppState>(context,listen:false);
    //  var school = Provider.of<SchoolAppState>(context,listen:false).selectedSchool;
    //  var year = Provider.of<SchoolAppState>(context,listen:false).selectedYear;
    final textTheme = Theme.of(context).textTheme;
        Decoration decorateBox =BoxDecoration(

       borderRadius:BorderRadius.circular(50),
       border:Border.all(color:Colors.orange.shade900,width:2),
       boxShadow:const [
                    BoxShadow(
                      color: Color.fromARGB(255, 184, 176, 176),
                      offset:  Offset(
                        0.0,
                        1.0,
                      ), ),
                       BoxShadow(
                      color: Colors.white,
                      offset: Offset(0.0, 0.0),
                      blurRadius: 0.0,
                      spreadRadius: 0.0,
                    ),  
                      ]     
       
     );
     TextStyle textStyle = TextStyle(
                color:const Color.fromRGBO(230, 81, 0, 1),
                fontSize: 12,
                fontWeight: FontWeight.w400,
                shadows: [
                 Shadow(
                blurRadius: 5.0,
                color: Colors.grey.shade500,
                offset:const Offset(0.0, 2.0),
                ),]
                );
      Decoration decorateIcon =BoxDecoration(
                 borderRadius: BorderRadius.circular(100),
                 color:Colors.orange.shade900,

      );
      
      // if(course.department.toString() == school?.name.toString() )
      
      // {  
      //   if(course.years.toString() == year?.value.toString()){
        
  return Material(
      child:GestureDetector(child: Container(
                
              margin:const EdgeInsets.all(10),
              decoration:decorateBox,
              height: 35,
              width:100,
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children:[
               const SizedBox( width: 10, ),
                Text(
                  course.title,
                 style:textStyle),
              Container(
               decoration: decorateIcon,
               child:const Icon(Icons.arrow_forward,
               color:Colors.white,
               size:18)
              ),]
    )
      ),onTap:(){
         // appState.selectCourse(course);
         BlocProvider.of<CommentBloc>(context).add(CommentFetch(course.id));
         Navigator.push(context, MaterialPageRoute(builder: (context) => CourseDetail(course)));
        
          //return  context.go('/commentList');
           })
    );
    
  }
    }