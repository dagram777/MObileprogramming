import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_9/Presentaion/widget/home/descriptionPage.dart';
import 'package:flutter_application_9/Presentaion/widget/userProfile/ProfilePage%20(3).dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';


class LandingPage extends StatefulWidget{
  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {

    int bottomNavBarIndex =0;
    final Screens = [ Describe(), const ProfilePage(),];
                       
  @override
  Widget build(BuildContext context){ 
   
     
   return Scaffold( 
     body: Screens[bottomNavBarIndex],
      bottomNavigationBar: BottomNavigationBar(
      
      currentIndex: bottomNavBarIndex,

      onTap:(int index){ setState((){
        bottomNavBarIndex = index;
        });},
      items: const <BottomNavigationBarItem>[
        
     BottomNavigationBarItem(
       icon: Icon(Icons.home ,color: Colors.orange,),
       label: "Home",
       
       
       ),
       BottomNavigationBarItem(
       icon: Icon(Icons.circle_notifications ,),
       label: "Profile",
      
       
       ),

       
   ]
   ),

   ); 
  }
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
  // Widget Logout() {
  //     return GestureDetector(
  //      // onTap: context.go("/login"),
  //       child :ElevatedButton(
  //           child: Text('Logout'),
  //           style: ButtonStyle(
  //             backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
  //             foregroundColor: MaterialStateProperty.all<Color>(Colors.orange),
  //             minimumSize: MaterialStateProperty.all( Size(100, 40)),
  //             shape:MaterialStateProperty.all<RoundedRectangleBorder>(
  //               RoundedRectangleBorder(
  //                 borderRadius: BorderRadius.circular(18.0),))),        
  //          onPressed: () {
             
  //             // print("Email: ${emailcontroller.text}");
  //             // print("Password: ${password}");
  //           })
  //     );
  //   }
 
  