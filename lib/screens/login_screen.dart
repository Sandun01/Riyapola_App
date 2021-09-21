import 'dart:async';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late String _username;
  late bool _passwordVisible = true;
  void initState() {
    _passwordVisible = false;
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
                decoration: const BoxDecoration(color: Colors.blue),
                child: Column(
                  children: <Widget>[
                    const Padding(
                      padding: EdgeInsets.only(top: 40.0),
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
                          left: 20.0, top: 20.0, right: 20.0, bottom: 0.0),
                      child: Row(
                        children: const [
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
                          left: 20.0, top: 20.0, right: 20.0, bottom: 0.0),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 30.0),
                              child: TextFormField(
                                decoration: const InputDecoration(
                                  icon: Icon(Icons.person, color: Colors.white),
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
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                                onSaved: (value) {
                                  _username = value.toString();
                                },
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: TextFormField(
                                keyboardType: TextInputType.text,
                                // controller: _userPasswordController,
                                obscureText:
                                    !_passwordVisible, //This will obscure text dynamically
                                decoration: const InputDecoration(
                                  icon:
                                      Icon(Icons.password, color: Colors.white),
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
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                                //
                              ),
                            ),
                            // Container(
                            //     child: Row(
                            //       children: [
                            //         // Button(
                            //         //   onPressed: null,
                            //         //   child: Text('Button', style: TextStyle(
                            //         //       color: Colors.blue
                            //         //   )
                            //         //   ),
                            //         //   textColor: Colors.white,
                            //         //   shape: RoundedRectangleBorder(side: BorderSide(
                            //         //       color: Colors.blue,
                            //         //       width: 1,
                            //         //       style: BorderStyle.solid
                            //         //   ), borderRadius: BorderRadius.circular(50)),
                            //         // ),
                            //         OutlinedButton(
                            //           onPressed: null,
                            //           style: ButtonStyle(
                            //             shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0))),
                            //           ),
                            //           child: const Text("Button text"),
                            //         ),
                            //       ]
                            //     ),
                            // ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
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
