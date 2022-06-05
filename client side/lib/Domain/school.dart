import 'package:flutter/material.dart';
abstract class SchoolState{}

class Schools extends SchoolState{
  String name;
  IconData icons;

  Schools({
   required this.name,
   required this.icons
  }
  );
  static List<Schools> nameOfdepartment=[
   Schools(name:"School of Biomedical Engineering",icons: Icons.abc_outlined),
   Schools(name:"School of Civil Engineering",icons: Icons.home_mini_outlined),
   Schools(name:"School of Chemical Engineering",icons : Icons.add_ic_call),
   Schools(name:"School of Electrical Engineering",icons : Icons.shop),
   Schools(name:"School of Software Engineering",icons : Icons.yard_outlined),
   Schools(name:"School of Mechanical Engineering",icons : Icons.data_saver_on),

  ];
}