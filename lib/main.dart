import 'package:flutter/material.dart';
import 'package:riyapola_app/screens/login_screen.dart';
import './screens//splash_screen.dart';

void main() => runApp(MaterialApp(
      theme: ThemeData(
        fontFamily: 'Averta',
        primaryColor: Colors.red,
        accentColor: Colors.yellowAccent,
      ),
      debugShowCheckedModeBanner: false,
      home: const Login(),
    ));
