import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_9/Application/User/bloc/user_bloc.dart';
import 'package:flutter_application_9/Domain/Student.dart';
import 'package:flutter_application_9/Presentaion/widget/LogIn/login.dart';
import 'package:flutter_application_9/Presentaion/widget/SchoolScreen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';


class sign extends StatefulWidget {
  sign({Key? key}) : super(key: key);

  @override
  State<sign> createState() => _signState();
}

class _signState extends State<sign> {
  final formKey2 = GlobalKey<FormState>();

  final emailcontroller = TextEditingController();

  final namecontroller = TextEditingController();

  final passController = TextEditingController();

  bool isPasswordVisible = true;

  String password = "";

  String email = "";

    
  @override
  Widget build(BuildContext context) {
    Widget buildName() {
      return (Center(
          child: Container(
        height: 50,
        width: 300,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  offset: Offset.fromDirection(-4.9, 3.0))
            ]),
        child: TextFormField(
          controller: namecontroller,
          decoration: InputDecoration(
              fillColor: Colors.orange,
              // suffixIcon: namecontroller.text.isEmpty
              //     ? Container(width: 0)
              //     : IconButton(
              //         onPressed: () => namecontroller.clear(),
              //         icon: Icon(Icons.close)),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none),
              labelText: 'Name',
              labelStyle: TextStyle(color: Colors.orange)),
        ),
      )));
    }

    Widget buildEmail() {
      return (Center(
          child: Container(
        height: 50,
        width: 300,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  offset: Offset.fromDirection(-4.9, 3.0))
            ]),
        child: TextFormField(
          controller: emailcontroller,
          decoration: InputDecoration(
              fillColor: Colors.orange,
              suffixIcon: emailcontroller.text.isEmpty
                  ? Container(width: 0)
                  : IconButton(
                      onPressed: () => emailcontroller.clear(),
                      icon: Icon(Icons.close,color: Colors.orange,)),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none),
              labelText: 'Email',
              labelStyle: TextStyle(color: Colors.orange)),
          validator: (String? email) {
            if (email == null || email.isEmpty) {
              return "Email must not be empty";
            }
            final emailTest = RegExp("[A-Za-z]@[A-Za-z].[A-Za-z]");
            final emailValid = emailTest.hasMatch(email);
            return emailValid ? null : "Email not valid";
          },
        ),
      )));
    }

    Widget buildPassword() {
      return (Center(
          child: Container(
        height: 50,
        width: 300,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                offset: Offset.fromDirection(-4.9, 3.0),
              )
            ]),
        child: TextFormField(
          onChanged: (value) => setState(() => this.password = value), 
          controller: passController,
          decoration: InputDecoration(
            fillColor: Colors.orange,
            suffixIcon: IconButton(
                color: Colors.orange,
                icon: isPasswordVisible
                    ? Icon(Icons.visibility_off)
                    : Icon(Icons.visibility),
                onPressed: () => setState(() => isPasswordVisible = !isPasswordVisible),
                 ),
                
            
            border: OutlineInputBorder(borderSide: BorderSide.none),
            labelText: 'Password',
            labelStyle: TextStyle(color: Colors.orange),
          ),
          obscureText: isPasswordVisible,
          validator: (String? password) {
            if (password == null || password.isEmpty) {
              return "Password must not be empty";
            }
            return password.length >= 8 ? null : "Password too short";
          },
        ),
      )));
    }

    return Scaffold(
        body: Center(
            child: Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("images/background2.jpg"),
                        fit: BoxFit.fill)),
                child: ListView(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(height: 300, width: 50),
                      Text(
                        "Sign Up",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.orange,
                            fontWeight: FontWeight.w700),
                      ),
                      TextButton(
                        onPressed: () {
                          context.go('/login');
                        },
                        child: const Text(
                          "Login",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.orange,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Form(
                      key: formKey2,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            buildName(),
                            const SizedBox(
                              height: 20,
                            ),
                            buildEmail(),
                            const SizedBox(
                              height: 20,
                            ),
                            buildPassword(),
                            const SizedBox(height: 20),
                            Center(
                                child: ElevatedButton(
                                    child: Text('Sign UP'),
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all<
                                                Color>(Colors.orange),
                                        foregroundColor:
                                            MaterialStateProperty.all<
                                                Color>(Colors.white),
                                        minimumSize:
                                            MaterialStateProperty.all(
                                                Size(200, 50)),
                                        shape: MaterialStateProperty.all<
                                                RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(18.0),
                                        ))),
                                    onPressed:
                                         () {
                                            // final formValid = formKey2
                                            //     .currentState!
                                            //     .validate();
                                            // if (!formValid) return;
                                            
                                            // authBloc.add(Signup(
                                            //     emailcontroller.text,
                                            //     passController.text,
                                            //     namecontroller.text));
                                            final user = Student(id: 1, username: namecontroller.text, password: passController.text, email: emailcontroller.text);
                                            BlocProvider.of<UserBloc>(context).add(SignUpButtonPressed(user));
                                            
                                          }),
                              
               
                ),

              BlocConsumer<UserBloc, UserState>(
               listener: (context, state) {
                 // TODO: implement listener
                 if(state is UserSignUpSucess){
                   
                    showDialog(
                      barrierDismissible: false,
                     context: context, 
                     builder: (_){
                      return CupertinoAlertDialog(
                     title: Text('Sign Up Completed!'),
                     content: Text('Thank you for regestering!'),
                     actions: [
                       CupertinoDialogAction(
                         child: Text('continue'),
                         onPressed: (){
                           Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) =>  login()), (route) => false);
                          //Navigator.pop(context);
                         },
                       ),
                     ],


                   );
                     }
                     );
                    
                 }else if( state is UserSignUpFailed){
                   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Signing up failed Try again!")));
                 }
                 
               },
             //  child: Container(),
              builder: (context, state){
               if(state is UserSignUpLoading){
                   return Center(child: CircularProgressIndicator());
                 }
               return Container();
             },
             ),
                ]
                )
                ),
                ])
                )
                ),
                
                );
  }
}
