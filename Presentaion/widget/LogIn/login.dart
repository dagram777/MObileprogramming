import 'package:flutter/material.dart';
import 'package:flutter_application_9/Application/User/bloc/user_bloc.dart';
import 'package:flutter_application_9/Domain/Student.dart';
import 'package:flutter_application_9/Presentaion/widget/SchoolScreen.dart';
import 'package:flutter_application_9/Presentaion/widget/home/landing_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class login extends StatefulWidget {
  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  final formKey2 = GlobalKey<FormState>();

  final emailcontroller = TextEditingController();

  final namecontroller = TextEditingController();

  final passController = TextEditingController();

  bool isPasswordVisible = true;

  String password = "";

  @override
  Widget build(BuildContext context) {
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
          controller: namecontroller,
          decoration: InputDecoration(
              fillColor: Colors.orange,
              suffixIcon: namecontroller.text.isEmpty
                  ? Container(width: 0)
                  : IconButton(
                      onPressed: () => namecontroller.clear(),
                      icon: Icon(
                        Icons.close,
                        color: Colors.orange,
                      )),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none),
              labelText: 'Email',
              labelStyle: TextStyle(color: Colors.orange)),
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
                    onPressed: () =>
                        setState(() => isPasswordVisible = !isPasswordVisible),
                  ),

                  border: OutlineInputBorder(borderSide: BorderSide.none),
                  labelText: 'Password',
                  labelStyle: TextStyle(color: Colors.orange),
                  // onChanged: (value) => setState(() => this.password = value),
                ),
                obscureText: isPasswordVisible,
              ))));
    }

    return Scaffold(
        appBar: AppBar(
          title: Text("login"),
        ),
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
                        "Login",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.orange,
                            fontWeight: FontWeight.w700),
                      ),
                      TextButton(
                          onPressed: () {
                            context.go("/signup");
                            // Navigator.push(context,
                            // MaterialPageRoute(builder: (context) => sign(),));
                          },
                          child: Text(
                            "Sign Up",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.orange,
                                fontWeight: FontWeight.bold),
                          )),
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
                            buildEmail(),
                            const SizedBox(
                              height: 20,
                            ),
                            buildPassword(),
                            const SizedBox(height: 20),
                            // buildButton(),

                            Center(
                                child: ElevatedButton(
                                    child: Text("LOGIN"),
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                Colors.orange),
                                        foregroundColor:
                                            MaterialStateProperty.all<Color>(
                                                Colors.white),
                                        minimumSize: MaterialStateProperty.all(
                                            Size(200, 50)),
                                        shape: MaterialStateProperty.all<
                                                RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(18.0),
                                        ))),
                                    onPressed: () {
                                      final formValid =
                                          formKey2.currentState!.validate();
                                      if (!formValid) return;

                                      final user = Student(
                                          id: 0,
                                          username: namecontroller.text,
                                          password: passController.text,
                                          email: emailcontroller.text);

                                      BlocProvider.of<UserBloc>(context)
                                          .add(LogInButtonPressed(user));
                                      // ),
                                      //            onPressed: () {
                                      //               print("Email: ${emailcontroller.text}");
                                      //               print("Password: ");
                                      //             });

                                      // context.go('/description');
                                    })),

                            BlocConsumer<UserBloc, UserState>(
                              listener: (context, state) {
                                // TODO: implement listener
                                if(state is UserAuthenticated){
                                  print("hi");
                                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => LandingPage()), (route) => false);
                                }
                              },
                              builder: (context, state) {
                                if (state is UserUnAuthenticated) {
                                  return const Text(
                                    "Wrong Username or Password",
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold),
                                  );
                                }
                                return Container(
                                  child: state is UserLogInLoading
                                      ? CircularProgressIndicator()
                                      : null,
                                );
                                return Container();
                              },
                            ),
                          ]))
                ]))));
  }
}
