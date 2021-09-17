import 'package:flutter/material.dart';
import './screens//splash_screen.dart';

void main() => runApp(MaterialApp(
      theme: ThemeData(
        fontFamily: 'Averta',
        primaryColor: Colors.red,
        accentColor: Colors.yellowAccent,
      ),
      debugShowCheckedModeBanner: false,
      home: const SpashScreen(),
    ));
