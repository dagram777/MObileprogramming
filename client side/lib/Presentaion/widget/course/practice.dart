import 'package:flutter/material.dart';

class Practice extends StatefulWidget{
  State<Practice> createState() => _practice();
}

class _practice extends State<Practice>{

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextFormField(
        controller: TextEditingController(),
        
      )
      

    );
  }}