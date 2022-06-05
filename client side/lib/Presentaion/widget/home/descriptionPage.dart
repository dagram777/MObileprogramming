import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Describe extends StatefulWidget{
   Describe({Key? key}) : super(key: key);

  @override
  State<Describe> createState() => _DescribeState();
}

class _DescribeState extends State<Describe> {
  int index =0;

  @override
  Widget build(BuildContext context) {

      return Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image:AssetImage("images/background2.jpg"),
              fit:BoxFit.fill, 
            )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [
              Text("Mateirial Uploader",style: TextStyle(
               fontSize: 40,
               fontWeight: FontWeight.w400
              ),),
              SizedBox(
                height: 150,
              ),
              Container(
                padding: EdgeInsets.fromLTRB(15,0,15,0),
                decoration: const BoxDecoration(
                 shape: BoxShape.circle

                ),
                child: Text("Clover has not only become the central place for all my notes and todos, it’s also become my go-to space when I need to think and work on complex problems. It’s crazy fast, and I love how it’s helping me organize my thoughts in a visual way.",
             style: TextStyle(
               
               letterSpacing: 1,
               fontStyle: FontStyle.italic,
               color: Colors.black),    
          ),
              ),
             
        SizedBox(
                height: 50,
              ),

   
        ElevatedButton(
            child: Text('tap to explore cources',style: TextStyle(
              fontStyle: FontStyle.italic,
              fontSize: 20
            ),),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.orange),
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              minimumSize: MaterialStateProperty.all( Size(200, 55)),
              shape:MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),))),        
           onPressed: () {
          context.go('/screenList');
             
            })          
            ],
          ),
    
        ),
  //   bottomNavigationBar: BottomNavigationBar(
      
  //     currentIndex: index,
  //     onTap:(int index){ setState((){ context.go('/'); });} ,
  //    //onTap: context.go('/'),
  //     items: const <BottomNavigationBarItem>[
        
  //    BottomNavigationBarItem(
  //      icon: Icon(Icons.home ,color: Colors.orange,),
  //      label: "Home",
       
       
  //      ),
  //      BottomNavigationBarItem(
  //      icon: Icon(Icons.circle_notifications ,),
  //      label: "Profile",
      
       
  //      ),

       
  //  ]
  //  ),
      );
  }
}