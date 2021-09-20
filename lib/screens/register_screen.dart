import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}


class _RegisterState extends State<Register> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late String _username;
  late bool _passwordVisible = true;
  void initState() {
    _passwordVisible = false;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ClipPath(
              clipper: MyClipper(),
              child: Container(
                width: double.infinity,
                height:700,
                decoration: BoxDecoration(
                    color: Color(0xFF0094FF),
                ),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 40.0),
                      child: Text("Riyapola",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left:40.0,top:30.0,right: 20.0,bottom: 0.0),
                      child: Row(
                        children: [
                          Text(
                            "Register",
                            style: TextStyle(
                              shadows: [
                                Shadow(
                                    color: Colors.white,
                                    offset: Offset(0, -10))
                              ],
                              color: Colors.transparent,
                              decoration:
                              TextDecoration.underline,
                              decorationColor: Colors.white,
                              decorationThickness: 4,
                              decorationStyle:
                              TextDecorationStyle.solid,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left:20.0,top:0.0,right: 20.0,bottom: 0.0),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 15.0),
                              child: TextFormField(
                                decoration: const InputDecoration(
                                  icon: const Icon(Icons.person,color: Colors.white),
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
                                onSaved: (value){
                                  _username = value.toString();
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 15.0),
                              child: TextFormField(
                                decoration: const InputDecoration(
                                  icon: const Icon(Icons.mobile_friendly,color: Colors.white),
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
                                onSaved: (value){
                                  _username = value.toString();
                                },
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 15.0),
                              child: TextFormField(
                                decoration: const InputDecoration(
                                  icon: const Icon(Icons.email,color: Colors.white),
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
                                  if (value == null) {
                                    return 'Usename cannot be empty';
                                  }
                                  return null;
                                },
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                                onSaved: (value){
                                  _username = value.toString();
                                },
                              ),
                            ),



                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 15.0),
                              child: TextFormField(
                                keyboardType: TextInputType.text,
                                // controller: _userPasswordController,
                                obscureText: !_passwordVisible,//This will obscure text dynamically
                                decoration: const InputDecoration(
                                  icon: const Icon(Icons.password,color: Colors.white),
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
                                  }
                                  else if (value.length < 6) {
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
                              padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 15.0),
                              child: TextFormField(
                                keyboardType: TextInputType.text,
                                // controller: _userPasswordController,
                                obscureText: !_passwordVisible,//This will obscure text dynamically
                                decoration: const InputDecoration(
                                  icon: const Icon(Icons.password,color: Colors.white),
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
                                  }
                                  else if (value.length < 6) {
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
                        child: Text('Register',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                          primary: Colors.black,
                          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: RichText(
                        text: new TextSpan(
                          children: [
                            new TextSpan(
                              text: 'Already have an account? ',
                              style: new TextStyle(color: Colors.black),
                            ),
                            new TextSpan(
                              text: 'Log In',
                              style: new TextStyle(color: Colors.blue),
                              recognizer: new TapGestureRecognizer()
                                ..onTap = () {},
                            ),
                          ],
                        ),
                      ),
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

class MyClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    // TODO: implement getClip
    var path = new Path();
    path.lineTo(0.0, size.height-60);
    var ControlPoint = new Offset(size.width/2.0, size.height);
    var EndPoint = new  Offset(size.width, size.height-60);
    path.quadraticBezierTo(ControlPoint.dx, ControlPoint.dy, EndPoint.dx, EndPoint.dy);
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
