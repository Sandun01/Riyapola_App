import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:riyapola_app/screens/home_screeen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:riyapola_app/screens/user_profile_screen.dart';
import 'package:riyapola_app/services/auth_services.dart';
import '../widgets/dialogbox/user_error_handling.dart';

import 'main_screen.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late bool _passwordVisible = true;

  void initState() {
    _passwordVisible = false;
  }

  void _RegisterButtonPress(BuildContext ctx) {
    print('_RegisterButtonPress');
    Navigator.of(ctx).pushReplacementNamed(
      '/register',
      arguments: {},
    );
  }

  void _skipBottonPress(BuildContext ctx) {
    print('Skip BottonPress');
    Navigator.of(ctx).pushReplacementNamed(
      '/home',
      arguments: {},
    );
  }


  void showDialogBox(String errormessage) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return CustomDialogBox(
            title: "Error...!",
            descriptions: errormessage,
            text: "OK",
          );
        });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ClipPath(
              clipper: MyClipper(),
              child: Container(
                width: double.infinity,
                height: 620,
                decoration: BoxDecoration(
                  color: Color(0xFF0094FF),
                ),
                child: Column(
                  children: <Widget>[
                    //skip text
                    Container(
                      padding: const EdgeInsets.only(
                        top: 35.0,
                        right: 20.0,
                      ),
                      alignment: Alignment.topRight,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          textStyle: const TextStyle(fontSize: 20),
                        ),
                        onPressed: () => _skipBottonPress(context),
                        child: const Text(
                          "Skip",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontFamily: 'Averta',
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 40.0),
                      child: Text(
                        "Riyapola",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 40.0, top: 30.0, right: 20.0, bottom: 0.0),
                      child: Row(
                        children: [
                          Text(
                            "Login",
                            style: TextStyle(
                              shadows: [
                                Shadow(
                                    color: Colors.white, offset: Offset(0, -10))
                              ],
                              color: Colors.transparent,
                              decoration: TextDecoration.underline,
                              decorationColor: Colors.white,
                              decorationThickness: 4,
                              decorationStyle: TextDecorationStyle.solid,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20.0, top: 60.0, right: 20.0, bottom: 0.0),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 30.0),
                              child: TextFormField(
                                controller: emailController,
                                decoration: const InputDecoration(
                                  icon: const Icon(Icons.person,
                                      color: Colors.white),
                                  hintText: 'Mobile Number or Email',
                                  hintStyle: TextStyle(
                                    color: Colors.white,
                                  ),
                                  labelText: "Mobile Number or Email",
                                  labelStyle: TextStyle(
                                    color: Colors.white,
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                  border: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null) {
                                    return 'Usename cannot be empty';
                                  }
                                  return null;
                                },
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: TextFormField(
                                controller: passwordController,
                                keyboardType: TextInputType.text,
                                // controller: _userPasswordController,
                                obscureText:
                                    !_passwordVisible, //This will obscure text dynamically
                                decoration: const InputDecoration(
                                  icon: const Icon(Icons.password,
                                      color: Colors.white),
                                  hintText: 'Password',
                                  hintStyle: TextStyle(
                                    color: Colors.white,
                                  ),
                                  labelText: "Password",
                                  labelStyle: TextStyle(
                                    color: Colors.white,
                                  ),
                                  // suffixIcon: IconButton(
                                  //   icon: Icon(
                                  //     // Based on passwordVisible state choose the icon
                                  //     _passwordVisible
                                  //         ? Icons.visibility
                                  //         : Icons.visibility_off,
                                  //     color: Theme.of(context).primaryColorDark,
                                  //   ),
                                  //   onPressed: () {
                                  //     // Update the state i.e. toogle the state of passwordVisible variable
                                  //     setState(() {
                                  //       _passwordVisible = !_passwordVisible;
                                  //     });
                                  //   },
                                  // ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                  border: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null) {
                                    return 'Password cannot be empty';
                                  } else if (value.length < 6) {
                                    return 'Password must be more than 6 characters';
                                  }
                                  return null;
                                },
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                                //
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              transform: Matrix4.translationValues(0.0, -60.0, 0.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: ElevatedButton(
                        child: Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onPressed: () {
                          final String email = emailController.text.trim();
                          final String password = passwordController.text.trim();

                          if(email.isEmpty){
                            print("Email is Empty");
                            showDialogBox("Email is Empty");
                          } else {
                            if(password.isEmpty){
                              print("Password is Empty");
                              showDialogBox("Password is Empty");
                            } else {
                              context.read<AuthService>().login(
                                context,
                                email,
                                password,
                              ).then((value) {
                                  print(value);
                                  if(value == "-1"){
                                    showDialogBox("Invalid Credentials");
                                  }
                              });
                              //
                              // print(x);
                              // print("lghkjghlgfkjhghjgfhjgfhlk");

                            }
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0)),
                          primary: Colors.black,
                          padding: EdgeInsets.symmetric(
                              horizontal: 40, vertical: 12),
                        ),
                      ),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        const Text(
                          "If you do not have account",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                        //sign up text
                        TextButton(
                          style: TextButton.styleFrom(
                            textStyle: const TextStyle(fontSize: 20),
                          ),
                          onPressed: () => _RegisterButtonPress(context),
                          child: const Text(
                            "Sign Up",
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 16,
                              fontFamily: 'Averta',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // TODO: implement getClip
    var path = new Path();
    path.lineTo(0.0, size.height - 60);
    var ControlPoint = new Offset(size.width / 2.0, size.height);
    var EndPoint = new Offset(size.width, size.height - 60);
    path.quadraticBezierTo(
        ControlPoint.dx, ControlPoint.dy, EndPoint.dx, EndPoint.dy);
    path.lineTo(size.width, 0.0);
    path.close();

    // throw UnimplementedError();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    // throw UnimplementedError();
    return true;
  }
}
