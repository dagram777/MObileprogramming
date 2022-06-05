import 'package:flutter/material.dart';
import 'package:flutter_application_9/Application/bloc/course_bloc.dart';
import 'package:flutter_application_9/Application/bloc/course_event.dart';
import 'package:flutter_application_9/Application/bloc/course_state.dart';
import 'package:flutter_application_9/Domain/Course.dart';
import 'package:flutter_application_9/Presentaion/State/AppState.dart';
import 'package:flutter_application_9/Presentaion/widget/course/CourseListItem.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import 'CourseList.dart';

class CoursePage extends StatelessWidget {
  int _schoolIndex;
  int _yearIndex;
  CoursePage(this._schoolIndex, this._yearIndex);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(items: const [
       BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.orangeAccent, size: 20),
            label: 'Home'),
        BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Colors.orangeAccent, size: 20),
            label: "profile")
      ]),
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
            color: Colors.amberAccent,
            image: DecorationImage(
              image: AssetImage("assets/page2.jpg"),
              fit: BoxFit.fill,
            )),
        child: Column(children: [
          GestureDetector(
            child: Container(
              margin: const EdgeInsets.fromLTRB(5, 20, 0, 0),
              child: const Align(
                alignment: Alignment.topLeft,
                child: Icon(Icons.arrow_back, color: Colors.white, size: 30),
              ),
            ),
            onTap: () => context.go("/yearList"),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(5, 20, 0, 0),
            child: const Align(
              alignment: Alignment.topLeft,
              child: Text("Hi John",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Colors.white)),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Icon(Icons.house, color: Colors.orange.shade800, size: 60),
          Container(
            height: 430,
            width: 350,
            margin: EdgeInsets.fromLTRB(30, 5, 30, 5),
            child: BlocBuilder<CourseBloc, CourseState>(
              builder: (context, state) {
                if( state is CourseSuccess){
                  return ListView.builder(
                    itemCount: state.course.length,
                    itemBuilder: (BuildContext context, int index){
                      return CourseListItem(state.course[index]);

                    }
                    );
                }
                return Container();
              },
            ),
          ),
        ]),
      ),
    );
  }
}
