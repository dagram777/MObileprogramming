import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class profiledit   extends StatefulWidget{

  @override
  State<profiledit> createState() => _profileditState();
}

class _profileditState extends State<profiledit> {
    int index =0;
  @override
  Widget build(BuildContext context) {
   return(
     Scaffold(
   
     body:Center(child: Column(
       children: [
    // buildstack(),
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
      onTap:()=>context.go("/profile")
      ),
      ),

     Positioned(
      top:10,
      right: 5, 

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
      // child: buttonEdit()),
      child:ElevatedButton(
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
             context.go('/profile');
           }
      )
    ),
      Positioned(
        bottom: 10,
        left: 8,
        child: texteditor()),    
   ]),
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
 
      // buildButton()
        Center(
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
             context.go('/profile');
            }),
      )
      
       ],
     )) ,
        bottomNavigationBar: BottomNavigationBar(
      
      currentIndex: index,
      onTap:(int index){ setState((){ context.go('/'); });} ,
     //onTap: context.go('/'),
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
   ));
  }
}

  Widget texteditor(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children:[
        Icon(Icons.home,
        size: 30,
        color: Colors.white,
        ),
        Text("Edit Profile",
      style: TextStyle(
        fontSize: 18,
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
              
            })
      );
    }
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
        height: 35,
        color: Colors.white,
          child: 
          TextFormField(
           
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
       padding: EdgeInsets.fromLTRB(5, 0, 10, 0),
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
        onChanged: (val){},
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

     
        )
      ],
    );
  }


   Widget buildButton() {
      return (
        
        Center(
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
            //  context.go
            }),
      ))
      
      ;}

    