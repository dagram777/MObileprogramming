import 'package:flutter/material.dart';
import 'package:flutter_application_9/Application/bloc/course_bloc.dart';
import 'package:flutter_application_9/Application/bloc/course_event.dart';
import 'package:flutter_application_9/Domain/Year.dart';
import 'package:flutter_application_9/Domain/school.dart';
import 'package:flutter_application_9/Infrastructure/course/courseRepoistory.dart';

import 'package:flutter_application_9/Presentaion/State/AppState.dart';
import 'package:flutter_application_9/Presentaion/widget/course/CoursePage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';


import '../../Application/comment/bloc/comment_bloc.dart';
import '../../Infrastructure/comment/commentDataProvider.dart';
import '../../Infrastructure/comment/commentRepoistory.dart';
import '../../Infrastructure/course/courseDataProvider.dart';



class YearListScreen extends StatelessWidget{
  CommentRepository commentRepository =
      CommentRepository(CommentDataProvider());
  
  CourseRepository courseRepository = CourseRepository(CourseDataProvider());
 
 int _schoolIndex;
 YearListScreen(this._schoolIndex);



 //final school = Schools.nameOfdepartment[index];


  @override
  Widget build(BuildContext context){
   
    //  var school = Provider.of<SchoolAppState>(context,listen:false).selectedSchool;
    //  print(school?.name??"");
    //  var appState = Provider.of<SchoolAppState>(context,listen:false);
    //  var years = appState.years;  

     
     var w = 230.0;
 
     Decoration decorate_box =BoxDecoration(

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

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          lazy: false,
          create: (context) => CommentBloc(commentRepository),
        ),
        BlocProvider(lazy: false, create: (context) => CourseBloc(courseRepository)),
      ],
      child: Scaffold(

      bottomNavigationBar: BottomNavigationBar(
          items: const [BottomNavigationBarItem(icon: Icon(Icons.home, color:Colors.orangeAccent,size:50),
          label:'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.person,color:Colors.orangeAccent,size:50),
          label:"profile")]),
   
   
      body:Container(
      decoration:const BoxDecoration(
        image:DecorationImage(
          image: AssetImage("assets/page2.jpg"),
          fit:BoxFit.fill)
      ),
      child:Column(
       children:[
         GestureDetector(
          child:Container(
              margin:const EdgeInsets.fromLTRB(5, 20, 0, 0),
           child:  const Align(
              alignment:Alignment.topLeft ,
            child:Icon(Icons.arrow_back,
           color:Colors.white,
           size:30),
            ),
            ),
            onTap: () => context.go('/'),),
              
           
          
          Container(
              margin:const EdgeInsets.fromLTRB(5, 20, 0, 0),
           child:  Align(
              alignment:Alignment.topLeft ,
            child:Icon(
              //school?.icons,
              Schools.nameOfdepartment.elementAt(_schoolIndex).icons,
           color:Colors.white,
           size:60),
            ),
            ),
           const SizedBox(
             height: 60,
           ),
             Align(
             alignment: Alignment.center,
          child:  Text (
           // school?.name??"",
              Schools.nameOfdepartment.elementAt(_schoolIndex).name,

           style:const TextStyle(
             fontWeight: FontWeight.bold,
             fontSize: 20,
             color:Color.fromRGBO(230, 81, 0, 1) ),
             ),),
          const SizedBox(
             height:20
           ),
           Container(
             height: 300,
             padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
            
             child: 
           ListView(
             
             children: [
              for(var year in Year.valueOfyears)
              InkWell(
              child: Container(
              margin:const EdgeInsets.all(5),
              decoration:decorate_box,
              height: 35,
              width:w,
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children:[
               const SizedBox( width: 10, ),
                Text(
                  year.name,
                 style:textStyle),
              Container(
               decoration: decorateIcon,
               child:const Icon(Icons.arrow_forward,
               color:Colors.white,
               size:18)
              ),
              ]
            ),
            ),
            onTap: (){
              BlocProvider.of<CourseBloc>(context).add(CourseFetched());
              Navigator.push(context, MaterialPageRoute(builder: (context) => CoursePage(_schoolIndex, Year.valueOfyears.indexOf(year))));
              

             
            //  appState.selectYear(year);
            // appState.selectYear(year);

            // return context.go('/CoursePage');
             }
          
              )
             ],
           )
           )
       ]
     
   )
 
  
    ),
    )
    );
}


 
  
}