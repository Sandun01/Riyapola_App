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
            CustomPaint(
              size: Size(
                  MediaQuery.of(context).size.width,
                  MediaQuery.of(context).size.height
                      .toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
              painter: RPSCustomPainter(),
            // ),
            child:
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(color: Colors.white.withOpacity(0.0)),
              child: Column(
                children: <Widget>[
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
                        left: 20.0, top: 20.0, right: 20.0, bottom: 0.0),
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
                                icon: const Icon(Icons.person,
                                    color: Colors.black),
                                hintText: 'Mobile Number or Email',
                                hintStyle: TextStyle(
                                  color: Colors.black,
                                ),
                                labelText: "Mobile Number or Email",
                                labelStyle: TextStyle(
                                  color: Colors.black,
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                                border: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                              ),
                              validator: (value) {
                                if (value == null) {
                                  return 'Usename cannot be empty';
                                }
                                return null;
                              },
                              style: TextStyle(
                                color: Colors.black,
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
                                icon: const Icon(Icons.password,
                                    color: Colors.black),
                                hintText: 'Password',
                                hintStyle: TextStyle(
                                  color: Colors.black,
                                ),
                                labelText: "Password",
                                labelStyle: TextStyle(
                                  color: Colors.black,
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
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                                border: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
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
                                color: Colors.black,
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
                          //         //   textColor: Colors.black,
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
        ),],
        ),
      ),
    );
  }
}



class RPSCustomPainter extends CustomPainter{
  
  @override
  void paint(Canvas canvas, Size size) {
    
    

  Paint paint_0 = new Paint()
      ..color = Color.fromARGB(255, 33,150,243)
      ..strokeWidth = 1;
     
         
         
    Path path_0 = Path();
    path_0.moveTo(0,size.height*0.1942502);
    path_0.quadraticBezierTo(size.width*0.8689236,size.height*0.2340715,size.width,size.height*0.9945610);
    path_0.quadraticBezierTo(size.width,size.height*0.7459207,size.width,0);
    path_0.lineTo(0,0);
    path_0.lineTo(0,size.height*0.1942502);
    path_0.close();

    canvas.drawPath(path_0, paint_0);

  
    
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
  
}

