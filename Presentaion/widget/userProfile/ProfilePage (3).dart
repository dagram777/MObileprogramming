import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
     body: Center(
     child:Column(
       children: [   
      Stack(
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
      top: 15,
      left: 10,
      child: GestureDetector( 
      child:   Icon(Icons.arrow_circle_left,
      size: 40, 
      color:Colors.white,),
      onTap:()=>context.go("/description")
      ),
      ),
     

     Positioned(
      top:10,
      right: 5, 
      // child: Logout()),
      child: ElevatedButton(
            child: Text('Logout'),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
              foregroundColor: MaterialStateProperty.all<Color>(Colors.orange),
              minimumSize: MaterialStateProperty.all( Size(100, 40)),
              shape:MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),))),        
           onPressed: () {
              context.go("/");
            })
      ),
   
      Positioned(
      top:50,
      right: 5, 
      child:  ElevatedButton(
            child: Text('Edit'),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
              foregroundColor: MaterialStateProperty.all<Color>(Colors.orange),
              minimumSize: MaterialStateProperty.all( Size(100, 40)),
              shape:MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),))),        
           onPressed: () {
          context.go('/edit');
             
            })
      ),
    
      
        Positioned(
          top:130,
          child: CicleImage())   
   ]),

       SizedBox(height: 80,),
     Container (
       
       alignment: Alignment.center,
       padding: EdgeInsets.all(5),
       child: const Text("Aksumawit Yemane",
        // 
     style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 25
     ),
     ),),
     Container(
       padding: EdgeInsets.all(8),
       child: Icon(
        Icons.desktop_windows,
        color: Colors.orange,
        size: 50,
       ),),
     Container (
       padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
      child: Text("Software Engineering Student",
      textAlign: TextAlign.center,
     style: TextStyle(
       overflow: TextOverflow.visible,
          fontWeight: FontWeight.w700,
          fontSize: 25
     ),
     )),
       ],
     )      
   ));
  }
  Widget CicleImage(){
    return  Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 5,
          color: Colors.white
        ),
        shape: BoxShape.circle
      ),
      child: CircleAvatar(
            radius: 50,
          backgroundImage: AssetImage("images/beuty.jpg",),
      ));   
  }
}