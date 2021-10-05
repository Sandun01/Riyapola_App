import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:riyapola_app/services/auth_services.dart';
import 'package:provider/provider.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController nameController = new TextEditingController();
  TextEditingController mobileController = new TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late bool _passwordVisible = true;
  void initState() {
    _passwordVisible = false;
  }

  void _signUpButtonPress(BuildContext ctx) {
    print('Sign In BottonPress');
    Navigator.of(ctx).pushReplacementNamed(
      '/login',
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
                height: 700,
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
                      padding: const EdgeInsets.only(top: 10.0),
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
                          left: 40.0, top: 40.0, right: 20.0, bottom: 0.0),
                      child: Row(
                        children: [
                          Text(
                            "Register",
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
                          left: 20.0, top: 0.0, right: 20.0, bottom: 0.0),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 10.0),
                              child: TextFormField(
                                controller: nameController,
                                decoration: const InputDecoration(
                                  icon: const Icon(Icons.person,
                                      color: Colors.white),
                                  hintText: 'Full Name',
                                  hintStyle: TextStyle(
                                    color: Colors.white,
                                  ),
                                  labelText: "Full Name",
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
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 10.0),
                              child: TextFormField(
                                controller: mobileController,
                                decoration: const InputDecoration(
                                  icon: const Icon(Icons.mobile_friendly,
                                      color: Colors.white),
                                  hintText: 'Mobile Number',
                                  hintStyle: TextStyle(
                                    color: Colors.white,
                                  ),
                                  labelText: "Mobile Number",
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
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 10.0),
                              child: TextFormField(
                                controller: emailController,
                                decoration: const InputDecoration(
                                  icon: const Icon(Icons.email,
                                      color: Colors.white),
                                  hintText: 'Email',
                                  hintStyle: TextStyle(
                                    color: Colors.white,
                                  ),
                                  labelText: "Email",
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
                                  if (value == null || !value.contains('@')) {
                                    return 'Please enter a valid email address';
                                  }
                                  return null;
                                },
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 10.0),
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
                                  // suffixIcon: Icon(Icons.visibility),
                                  // suffixIcon: IconButton(
                                  //   icon: Icon(_passwordVisible ? Icons.visibility : Icons.visibility_off,
                                  //     // color: Theme.of(context).primaryColorDark,
                                  //   ),
                                  //   onPressed: () {
                                  //     setState(() {
                                  //       _passwordVisible = !_passwordVisible;
                                  //     }),
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
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 10.0),
                              child: TextFormField(
                                controller: passwordController,
                                keyboardType: TextInputType.text,
                                // controller: _userPasswordController,
                                obscureText:
                                    !_passwordVisible, //This will obscure text dynamically
                                decoration: const InputDecoration(
                                  icon: const Icon(Icons.password,
                                      color: Colors.white),
                                  hintText: 'Confirm Password',
                                  hintStyle: TextStyle(
                                    color: Colors.white,
                                  ),
                                  labelText: "Confirm Password",
                                  labelStyle: TextStyle(
                                    color: Colors.white,
                                  ),
                                  // suffixIcon: Icon(Icons.visibility),
                                  // suffixIcon: IconButton(
                                  //   icon: Icon(_passwordVisible ? Icons.visibility : Icons.visibility_off,
                                  //     // color: Theme.of(context).primaryColorDark,
                                  //   ),
                                  //   onPressed: () {
                                  //     setState(() {
                                  //       _passwordVisible = !_passwordVisible;
                                  //     }),
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
                  // Button(
                  //   onPressed: null,
                  //   child: Text('Button', style: TextStyle(
                  //       color: Colors.blue
                  //   )
                  //   ),
                  //   textColor: Colors.white,
                  //   shape: RoundedRectangleBorder(side: BorderSide(
                  //       color: Colors.blue,
                  //       width: 1,
                  //       style: BorderStyle.solid
                  //   ), borderRadius: BorderRadius.circular(50)),
                  // ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: ElevatedButton(
                      child: Text(
                        'Register',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: () {
                        final String email = emailController.text.trim();
                        final String password = passwordController.text.trim();
                        final String name = nameController.text.toString();
                        final String mobile = mobileController.text.trim();

                        if (email.isEmpty) {
                          print("Email is Empty");
                        } else {
                          if (password.isEmpty) {
                            print("Password is Empty");
                          } else {
                            context
                                .read<AuthService>()
                                .signUp(email, password, name, mobile)
                                .then((value) async {
                              User? user = FirebaseAuth.instance.currentUser;

                              await FirebaseFirestore.instance
                                  .collection("users")
                                  .doc(user!.uid)
                                  .set({
                                'uid': user.uid,
                                'email': email,
                                'name': name,
                                'mobile': mobile,
                              });
                            });
                          }
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0)),
                        primary: Colors.black,
                        padding:
                            EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child:
                        // Text Sign up
                        Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //sign up text
                        TextButton(
                          style: TextButton.styleFrom(
                            textStyle: const TextStyle(fontSize: 20),
                          ),
                          onPressed: () => _signUpButtonPress(context),
                          child: const Text(
                            "Sign In",
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 20,
                              fontFamily: 'Averta',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const Text(
                          "to Start Explore",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    // RichText(
                    //   text: new TextSpan(
                    //     children: [
                    //       new TextSpan(
                    //         text: 'Already have an account? ',
                    //         style: new TextStyle(color: Colors.black),
                    //       ),
                    //       new TextSpan(
                    //         text: 'Log In',
                    //         style: new TextStyle(color: Colors.blue),
                    //         recognizer: new TapGestureRecognizer()
                    //           ..onTap = () {},
                    //       ),
                    //     ],
                    //   ),
                    // ),
                  ),
                ],
              ),
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
