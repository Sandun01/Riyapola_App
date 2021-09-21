import 'dart:async';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  void _skipBottonPress() {
    print('Skip BottonPress');
  }

  void _signUpButtonPress() {
    print('Sign In BottonPress');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ClipPath(
              clipper: WelcomeClipper(),
              child: Container(
                padding: const EdgeInsets.only(
                  top: 35.0,
                  right: 20.0,
                ),
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.blue,
                ),
                child: Column(
                  children: <Widget>[
                    //skip text
                    Container(
                      alignment: Alignment.topRight,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          textStyle: const TextStyle(fontSize: 20),
                        ),
                        onPressed: _skipBottonPress,
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
                    //hello text
                    Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.only(
                        top: 80.0,
                        bottom: 60.0,
                      ),
                      child: const Text(
                        "Hello",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 60,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    // Images
                    Container(
                      alignment: Alignment.center,
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 60,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Column(
              children: [
                //icon
                const Image(
                  image: AssetImage('assets/images/welcome_logo_icon.png'),
                  height: 100,
                  width: 100,
                ),
                //text image
                const Image(
                  image: AssetImage('assets/images/welcome_logo_text.png'),
                  width: 300,
                ),
                //spacing
                const SizedBox(
                  width: double.infinity,
                  height: 30.0,
                ),
                // Text Sign up
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //sign up text
                    TextButton(
                      style: TextButton.styleFrom(
                        textStyle: const TextStyle(fontSize: 20),
                      ),
                      onPressed: _signUpButtonPress,
                      child: const Text(
                        "Sign Up",
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
                // spacing
                const SizedBox(
                  width: double.infinity,
                  height: 30.0,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class WelcomeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // TODO: implement getClip
    var path = new Path();
    path.lineTo(0.0, size.height - 50);
    var ControlPoint = new Offset(size.width / 2.0, size.height);
    var EndPoint = new Offset(size.width, size.height - 50);
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
    throw UnimplementedError();
  }
}
