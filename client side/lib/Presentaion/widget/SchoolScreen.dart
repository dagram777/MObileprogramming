import 'package:flutter/material.dart';
import 'package:flutter_application_9/Domain/school.dart';
import 'package:flutter_application_9/Presentaion/State/AppState.dart';
import 'package:flutter_application_9/Presentaion/widget/YearList.dart';
import 'package:flutter_application_9/Presentaion/widget/course/CourseList.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class SchoolListScreen extends StatelessWidget{
  
   @override
  Widget build(BuildContext context) {
       var w = 230.0;
       int index= 0;
      // var appState = Provider.of<SchoolAppState>(context,listen:false);
    
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
 
      return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          items: const [BottomNavigationBarItem(icon: Icon(Icons.home, color:Colors.orangeAccent,size:30),
          label:'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.person,color:Colors.orangeAccent,size:30),
          label:"profile")]),
        body:Container(
      constraints: const BoxConstraints.expand(),
      decoration: const BoxDecoration(
        color:Colors.amberAccent,
        image:DecorationImage(
          image: AssetImage("assets/page2.jpg"),
          fit:BoxFit.fill,
          )
      ),
      child: Column(
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
           child: const Align(
              alignment:Alignment.topLeft ,
            child:Text("Hi John",
            style:TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color:Colors.white
            )),
            ),
            ),
           const SizedBox(
             height: 50,
           ),
           Icon(Icons.house,
           color:Colors.orange.shade800,
           size:60),
          const SizedBox(
             height:20
           ),
           Container(
             height: 280,
             margin: EdgeInsets.all(25),
            
             child: 
           ListView(
             
             children: [
               for(var school in Schools.nameOfdepartment )
                  
               GestureDetector(
                 
                
             child:  Container(
                
              margin:const EdgeInsets.all(5),
              decoration:decorateBox,
              height: 35,
              width:w,
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children:[
               const SizedBox( width: 10, ),
                Text(
                  school.name,
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
            onTap:() {
            //  index++;
              Navigator.push(context, MaterialPageRoute(builder: (context) => YearListScreen(Schools.nameOfdepartment.indexOf(school)) ));
              
            //
            
          
            
           // return context.go('/yearList');
            }
               )

             ],
           )
           )
       ]
     
   )
    )
      );

  }

 }