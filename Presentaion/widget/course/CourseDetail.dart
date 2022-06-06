import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_9/Application/comment/bloc/comment_bloc.dart';
import 'package:flutter_application_9/Domain/Course.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class CourseDetail extends StatelessWidget{
  Course course;
  CourseDetail(this.course);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.black,),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("Course", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 18),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              child: Text(
                course.title,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),

              ),

            ),
            Container(
              child: Text("Department ${course.department}, year ${course.years}",
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w300),),

            ),
            SizedBox(height: 20,),
            Container(
              child: Text(
                'Materials',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),

              ),

            ),
            SizedBox(height: 20,),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("pdf Link"),
                  GestureDetector(
                    child: const Text(
                      'Click here to download PDF',
                      style: TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                      ),

                      onTap: () async{
                        try{
                          await launchUrlString(course.pdf);
                        }catch (e){
                          debugPrint('Error happened opening the link');
                        }
                      },
                    ),
                ],
              ),
            ),
            SizedBox(height: 20,),
            Container(
              child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
               
                children: [
                  Text("Video Link"),
                  GestureDetector(
                    child: const Text(
                      'Click here to download video!',
                      style: TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                      ),

                      onTap: () async{
                        try{
                          await launchUrl(Uri.parse(course.video));
                        }catch (e){
                          debugPrint(e.toString());
                        }
                      },
                    ),
                ],
              ),
            ),
            SizedBox(height: 50,),

          

           Center(
             child: Text("Comments", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),),
   
           Container(
             width: 300,
              child:TextFormField(
             controller: TextEditingController(),
           ),),
           SizedBox(
             height:20
           ),
           GestureDetector(
             child:Container(
               height: 40,
               width: 80,
               padding: EdgeInsets.fromLTRB(18, 0, 10, 0),
              
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.orangeAccent,
               ),
               child: Text("send"),
              
             ),
             onTap:() => context.go('/CourseDetail') ,
           ),


           Expanded(
             child: Container(
               child: BlocBuilder<CommentBloc, CommentState>(
                 builder: (context, state) {
                   if(state is CommentSuccess){
                     return
                    ListView.builder(
                    itemCount: state.comment.length,
                    itemBuilder: (BuildContext context, int index){
                      return ListTile(
                        title: Text(state.comment[index].description, style: TextStyle(color: Colors.black),),
                     
                     
                      );
                     
                    }
                    );
                   }
                   return Container();
                 }
                 ),
             ),
           ),
             
          ],
        ),
      )

    );
  }
}