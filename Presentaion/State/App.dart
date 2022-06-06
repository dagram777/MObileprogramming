import 'package:flutter/material.dart';
import 'package:flutter_application_9/Presentaion/widget/HomeScreen.dart';
import 'package:flutter_application_9/Presentaion/widget/LogIn/login.dart';
import 'package:flutter_application_9/Presentaion/widget/SchoolScreen.dart';
import 'package:flutter_application_9/Presentaion/widget/Signup/signup.dart';
import 'package:flutter_application_9/Presentaion/widget/YearList.dart';
import 'package:flutter_application_9/Presentaion/widget/course/CourseDetialsScreen.dart';
import 'package:flutter_application_9/Presentaion/widget/course/CoursePage.dart';
import 'package:flutter_application_9/Presentaion/widget/course/commentScreen.dart';
import 'package:flutter_application_9/Presentaion/widget/course/practice.dart';
import 'package:flutter_application_9/Presentaion/widget/home/landing_page.dart';
import 'package:flutter_application_9/Presentaion/widget/upload/upload.dart';
import 'package:flutter_application_9/Presentaion/widget/userProfile/ProfilePage%20(3).dart';
import 'package:flutter_application_9/Presentaion/widget/userProfile/profiledit%20(3).dart';
import 'package:go_router/go_router.dart';

class App extends StatelessWidget{
  App({Key? key}) : super(key: key);
  Widget build(BuildContext context){
    return MaterialApp.router(
      routeInformationParser: _router.routeInformationParser, 
      routerDelegate: _router.routerDelegate);
  }
  final _router = GoRouter(
    routes:[
      GoRoute(path: '/',
     builder: (context,state)=>HomeScreen()
      ),
      GoRoute(path:'/login',
      builder:(context,state) => login()
      ),
       GoRoute(path:'/signup',
      builder:(context,state) => sign()
      ),
     

      GoRoute(path: '/describePage',
     builder: (context,state)=> LandingPage ()
      ),
      GoRoute(path: '/screenList',
      builder:(context,state) => SchoolListScreen()
      ),
      GoRoute(
        path: '/profile',
        builder: (BuildContext context, GoRouterState state) =>
             ProfilePage(),
      ),
        GoRoute(
        path: '/edit',
        builder: (BuildContext context, GoRouterState state) =>
             profiledit(),
      ),
        GoRoute(
        path: '/LogOut',
        builder: (BuildContext context, GoRouterState state) =>
             HomeScreen(),
      ),

    //  GoRoute(path: '/yearList',
    //  builder: (context,state)=> YearListScreen()
    //   ),
    //    GoRoute(path: '/CoursePage',
    //  builder: (context,state)=> CoursePage()
    //   ),
    //   GoRoute(path: '/commentList',
    //   builder:(context,state)=> CommentScreen())

      
    ]);
}