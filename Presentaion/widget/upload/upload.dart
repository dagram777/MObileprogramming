


import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_9/Application/bloc/course_bloc.dart';
import 'package:flutter_application_9/Application/bloc/course_event.dart';
import 'package:flutter_application_9/Application/bloc/course_state.dart';
import 'package:flutter_application_9/Application/comment/bloc/comment_bloc.dart';
import 'package:flutter_application_9/Domain/Course.dart';
import 'package:flutter_application_9/Presentaion/widget/LogIn/login.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class upload   extends StatefulWidget{
   upload({Key? key}) : super(key: key);

  @override
  State<upload> createState() => _uploadState();
}

class _uploadState extends State<upload> {

  
   var depcontroller;
   var yearcontroller ;
   var pdf;
   var role;

  // final depcontroller = TextEditingController();

   final namecontroller = TextEditingController();

  

  //  var data = User(id: depcontroller, email: pdf, name: role, role: namecontroller);

  @override
  Widget build(BuildContext context) {

 Widget name(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        
     Container (
       padding: EdgeInsets.fromLTRB(5, 0, 60, 0),
       child:  Text("Name :",
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600
        ),
        )),  
        Container(
          width: 200,
        height: 30,
        color: Colors.white,
          child: TextFormField(
            controller: namecontroller,
            showCursor: true,
            
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color(24)),
                borderRadius: BorderRadius.circular(15))
            ),
          ),
        )
      ],
    );
  }
 Widget department(){
     List dep = ["School of Biomedical Engineering","School of Civil Engineering", "School of Chemical Engineering","School of Electrical Engineering","School of Software Engineering","School of Mechanical Engineering"];
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        
     Container (
       padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
       child:  Text("Department :",
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600
        ),
        )),  
        Container(
        width: 270,
        height: 35,
        color: Colors.white,
          child:DropdownButtonFormField(
        onChanged: (val){
          depcontroller=val;

          
        },
          items: dep.map((e) => DropdownMenuItem<String>(
        value: e,
        child: Row(
          children: [
            // Icon(
            //   Icons.exit_to_app,
            //   color: Colors.black,
            // ),
            const SizedBox(
              height: 8,
            ),
            Text(e)
          ],
        ),
      )).toList()) 

          // TextFormField(
          //   autocorrect: true ,
          //   decoration: InputDecoration(
          //     suffixIcon: Icon(
          //       Icons.arrow_drop_down_circle
                
          //       ),
          //     suffixIconColor: Colors.orange,
          //     border: OutlineInputBorder(
          //       borderSide: BorderSide(
          //         color: Color(24)),
          //       borderRadius: BorderRadius.circular(15))
          //   ),
          // ),
        )
      ],
    );
  }

 Widget Year(){
     List dep = ["First Year Courses","Second Year Courses","Third Year Courses","Fourth Year Courses","Fifth Year Courses"];
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        
     Container (
       padding: EdgeInsets.fromLTRB(5, 0, 15, 0),
       child:  Text("Year :",
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600
        ),
        )),
        
        Container(
        width: 220,
        height: 35,
        
        color: Colors.white,
          child:DropdownButtonFormField(
            
        onChanged: (val){
         yearcontroller=val;
        },
          items: dep.map((e) => DropdownMenuItem<String>(
        value: e,
        child: Row(
          children: [
           
            const SizedBox(
              height: 8,
            ),
            Text(e)
          ],
        ),
      )).toList()) 

          // TextFormField(
          //   autocorrect: true ,
          //   decoration: InputDecoration(
          //     suffixIcon: Icon(
          //       Icons.arrow_drop_down_circle
                
          //       ),
          //     suffixIconColor: Colors.orange,
          //     border: OutlineInputBorder(
          //       borderSide: BorderSide(
          //         color: Color(24)),
          //       borderRadius: BorderRadius.circular(15))
          //   ),
          // ),
        )
      ],
    );
  }


    Widget Pdf(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        
     Container (
       padding: EdgeInsets.fromLTRB(5, 0, 10, 0),
       child:  Text("Pdf :",
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600
        ),
        )), 

       
        RaisedButton(
          color: Colors.white,
      child: Text('   CHOOSE FILE    ',
      style: TextStyle(
        fontSize: 15

      ),),
      focusColor: Colors.blue,
      hoverColor: Colors.orange,
      onPressed: () async {
        // var picked = File.patj;
        
        // picke=file
        //   var picked = await FileReader.loadStartEvent;
        // if (picked != null) {
        //   print(picked.files.first.name);
      //   }
        

      // }
   
      // },
      }
    )
        // Container(
        //   width: 170,
        // height: 35,
        // color: Colors.white,
          
        //   child: 
        //   TextFormField(
        //     decoration: InputDecoration(
        //       border: OutlineInputBorder(
        //         borderSide: BorderSide(
        //           color: Color(24)),
        //         borderRadius: BorderRadius.circular(15))
        //     ),
        //   ),
        // )
      ],
    );
  }
  Widget Vedio(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        
     Container (
       padding: EdgeInsets.fromLTRB(5, 0, 10, 0),
       child:  Text("Video :",
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600
        ),
        )), 

       
        RaisedButton(
          color: Colors.white,
      child: Text('   CHOOSE FILE    ',
      style: TextStyle(
        fontSize: 15

      ),),
      focusColor: Colors.blue,
      hoverColor: Colors.orange,
      onPressed: () async {
        // var picked = File.patj;
        
        // picke=file
        //   var picked = await FileReader.loadStartEvent;
        // if (picked != null) {
        //   print(picked.files.first.name);
      //   }
        

      // }
   
      // },
      }
    )
        // Container(
        //   width: 170,
        // height: 35,
        // color: Colors.white,
          
        //   child: 
        //   TextFormField(
        //     decoration: InputDecoration(
        //       border: OutlineInputBorder(
        //         borderSide: BorderSide(
        //           color: Color(24)),
        //         borderRadius: BorderRadius.circular(15))
        //     ),
        //   ),
        // )
      ],
    );
  }


    Widget buildButton(BuildContext context) {
      return (Center(
        child: ElevatedButton(
            child: Text('Post'),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.orange),
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              minimumSize: MaterialStateProperty.all( Size(200, 50)),
              shape:MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  
    )
  )
),        
           onPressed: () {
              
            BlocProvider.of<CourseBloc>(context).add(CourseCreate(1, this.namecontroller.text, this.pdf, this.pdf, this.yearcontroller, this.depcontroller));;
               
              //  print("dep: ${items}");
            }),
      ));
      }

   return(
     Scaffold(
     body:Center(child: Column(
       children: [
    buildstack(),
            SizedBox(
        height: 60,
      ),
      name(),
      SizedBox(
        height: 20,
      ),
      department(),
      SizedBox(
        height: 20,
      ),
      Year(),

       SizedBox(
        height: 20,
      ),
      
      Pdf(),
      SizedBox(
        height: 50,
      ),

      Vedio(),
       SizedBox(
        height: 20,
      ),

      (Center(
        child: ElevatedButton(
            child: Text('Post'),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.orange),
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              minimumSize: MaterialStateProperty.all( Size(200, 50)),
              shape:MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  
    )
  )
),        
           onPressed: () {
              
            BlocProvider.of<CourseBloc>(context).add(CourseCreate(1, this.namecontroller.text, this.pdf, this.pdf, this.yearcontroller, this.depcontroller));;
               
              //  print("dep: ${items}");
            }),
      )),
            BlocConsumer<CourseBloc, CourseState>(
               listener: (context, state) {
                 // TODO: implement listener
                 if(state is CourseCreated){
                    showDialog(
                      barrierDismissible: false,
                     context: context, 
                     builder: (_){
                      return CupertinoAlertDialog(
                     title: Text('Uploading Completed!'),
                     content: Text('Thank you for Uploading!'),
                     actions: [
                       CupertinoDialogAction(
                         child: Text('continue'),
                         onPressed: (){
                           Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) =>  login()), (route) => false);
                          //Navigator.pop(context);
                         },
                       ),
                     ],


                   );
                     }
                     );
                    
                 }else if( state is CourseFailed){
                   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Uploading failed Try again!")));
                 }
                 
               },
             //  child: Container(),
              builder: (context, state){
               if(state is CourseLoading){
                   return Center(child: CircularProgressIndicator());
                 }
               return Container();
             },
             ),
                ]
                )
                ),
                

      bottomNavigationBar: BottomNavigationBar(items: <BottomNavigationBarItem>[
     BottomNavigationBarItem(
       icon: Icon(Icons.home ,
       size: 30,
       color: Colors.orange,),
       label: "Home",
       
       
       ),
       BottomNavigationBarItem(

       icon: Icon(Icons.circle_notifications ,size: 30,),
       label: "Profile",
       
       ),

       
   ]
   ),
   )
   );
  }
}

 Widget buildstack(){
  return( Stack(
       clipBehavior: Clip.none,
      alignment: Alignment.center,
      children:[
    Positioned (
      child:  Container(
        width: 400,
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.orange, 
        ))),

   Positioned(
      top: 10,
      left: 10,
      child: Icon(Icons.arrow_circle_left,
      size: 30, 
      color:Colors.white,)),

     Positioned(
      top:10,
      right: 5, 
      child: Logout()),

      Positioned(
      top:50,
      right: 5, 
      child: buttonEdit()),
      Positioned(
        bottom: 10,
        left: 8,
        child: texteditor()),    
   ]));
}

  Widget texteditor(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children:[
     
        Text("Upload Course",
      style: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.w600,

        color: Colors.white
      ),
      ),
      
    ]
    );
  }
 
  Widget Logout() {
      return (ElevatedButton(
            child: Text('Logout'),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
              foregroundColor: MaterialStateProperty.all<Color>(Colors.orange),
              minimumSize: MaterialStateProperty.all( Size(100, 40)),
              shape:MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),))),        
           onPressed: () {
              // print("Email: ${emailcontroller.text}");
              // print("Password: ${password}");
            })
      );
    }
 
   
  Widget buttonEdit() {
      return (ElevatedButton(
            child: Text('Profile'),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
              foregroundColor: MaterialStateProperty.all<Color>(Colors.orange),
              minimumSize: MaterialStateProperty.all( Size(100, 40)),
              shape:MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  
    )
  )
),        
           onPressed: () {
           }
      ));
    }

 

    