
import 'package:flutter/material.dart';
import 'package:flutter_application_9/Presentaion/State/AppState.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class CourseDetailsScreen extends StatefulWidget{
  State<CourseDetailsScreen> createState() => _courseDetailScreen();

}
class _courseDetailScreen extends State<CourseDetailsScreen>{
  
  @override
  Widget build(BuildContext context){
    var courses = Provider.of<SchoolAppState>(context,listen:false).selectedCourse;
     Color colors =Colors.orange.shade800;
    BoxDecoration decorate =BoxDecoration(
            color:colors,
            borderRadius: BorderRadius.circular(30),
          );
    return Scaffold(
   
      body: Column(
     
      children: [
             InkWell(
          child:Container(
              margin:const EdgeInsets.fromLTRB(5, 20, 0, 0),
           child:  const Align(
              alignment:Alignment.topLeft ,
            child:Icon(Icons.arrow_back,
           color:Colors.orange,
           size:30),
            ),
            ),
            onTap: () => context.go('/courseList'),),
      Container(
      width:300,
      height: 150,
      margin: EdgeInsets.fromLTRB(10, 40, 10, 20),
      decoration: BoxDecoration(
        
        borderRadius: BorderRadius.circular(10),
        image:const DecorationImage(
              image: ExactAssetImage('assets/page3.jpg'),
              fit:BoxFit.fill)

      ),
      
      ),
      Container(
        margin: EdgeInsets.all(20),
       child:Align(
       alignment: AlignmentDirectional.topStart,
       child: Text(courses?.title??"",
       style:TextStyle(
         color:colors,
         fontSize: 24,
         fontWeight: FontWeight.w500

       )),),),
      
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children:[
          Container(
            height: 35,
            width:100,
            padding: EdgeInsets.fromLTRB(20, 5, 20, 3),
            
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              border:Border.all(color:colors,width:2)

            ),
            child:Text("Material",
            style:TextStyle(
              color:colors
            )),
            ),
            SizedBox(width:50),
          Container(
            height: 35,
            width:100,
            padding: EdgeInsets.fromLTRB(20, 5, 10, 3),
            
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              border:Border.all(color:colors,width:2),
            ),
            child:Text("Comment",
            style:TextStyle(
              color:colors
            ))
            
          )
        ]
      ),
      SizedBox(
        height: 20,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
        Row(          
          children: [
          Icon(Icons.video_library,
          color: colors,),
          SizedBox(width:20),
          Text(courses?.video??"",
          style:TextStyle(
            color:colors
          ))
        ],),
        SizedBox(width:50),
        Container(
          padding:EdgeInsets.fromLTRB(20, 5, 10, 3),
          height:35,
          width:100,
          decoration:decorate ,
          child:Text("Download",  style:TextStyle(
            color:Colors.white
          )),)
      ],),
      Divider(),
       Row(
         mainAxisAlignment: MainAxisAlignment.spaceAround,
         
         children: [
        Row(children: [
          Icon(Icons.picture_as_pdf,
          color:colors),
          SizedBox(width:20),
          Text(courses?.title??"",
            style:TextStyle(
            color:colors
          )),
        ],),
        SizedBox(width:50),
        Container(
          padding:EdgeInsets.fromLTRB(20, 5, 10, 3),
          height:35,
          width:100,
          decoration: decorate,
          child:Text("Download",
          style:TextStyle(
            color:Colors.white
          )),)
      ],),
      Divider(),
      Row(
        
        children: [
      //   Row(children:  [
      //     SizedBox(width:20),
      //     Icon(Icons.document_scanner_outlined,
      //     color:colors),
      //      SizedBox(width: 15,),
      //     Text(courses?.syllbus??"",
      //     style:TextStyle(
      //       color:colors)
      //     )
      //   ],),
      //   SizedBox(width: 90,),
      //   Container(
      //    padding:EdgeInsets.fromLTRB(20, 5, 10, 3),
      //     height: 35,
      //     width: 100,
      //     decoration: decorate,
          
      //     child:Text("Download",
      //     style:TextStyle(
      //     color:Colors.white),))
      // ],),
      // Divider(),
      Container(
        margin: EdgeInsets.only(left:20),
      child: Align(
        alignment: AlignmentDirectional.topStart,
      child: Text("Uploaded By:"),
      ),),
      Divider(),
      Row(
        children:[
      Container(
        margin: EdgeInsets.fromLTRB(20, 0, 5, 0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color:colors
        ),
      child: Icon(Icons.person,
      size:30,
      color:Colors.white),
      ),
      Text("D/r Abebe Kebede"),]),
      Divider()

    ])
   ]   ) 
    );
  }
}