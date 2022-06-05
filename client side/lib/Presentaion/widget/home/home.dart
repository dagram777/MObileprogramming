import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class HomeScreen extends StatelessWidget{
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
  @override
  Widget build(BuildContext context){
    return Scaffold(
  //  appBar: AppBar(
  //    title: Text("home",
  //    style: TextStyle(
  //      color: Colors.orange
  //    ),
     
  //    ),
  //  ),
      body:Container(
        alignment: Alignment.bottomCenter,
         constraints: const BoxConstraints.expand(),
        
        decoration: const BoxDecoration(
          image: DecorationImage(
            image:AssetImage("images/photo0.jpg") ,
            fit:BoxFit.fill,)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children:[GestureDetector(
          
          child: Container(
             width: 200,
             height:35,
             padding: EdgeInsets.only(left: 55,top:5),
             decoration: BoxDecoration(
             
       borderRadius:BorderRadius.circular(50),
       color: Colors.orange,
     
       boxShadow:const [
                    BoxShadow(
                     
                      offset:  Offset(
                        0.0,
                        1.0,
                      ), ),
                       BoxShadow(
                      
                      offset: Offset(0.0, 0.0),
                      blurRadius: 0.0,
                      spreadRadius: 0.0,
                    ),  
                      ]     
     ),  
            child:const Text("GET STARTED",
            style: TextStyle(
              color:Colors.black,
              fontWeight: FontWeight.w800,
               shadows: [
                 Shadow( 
                offset:Offset(0.5, 0.5),
                ),]
            ),)
          ),
          onTap: () => context.go('/login')
        ),
        SizedBox(
          height: 170,
        )]
        )
      ),
    );
  }

}