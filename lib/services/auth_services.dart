
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:riyapola_app/screens/home_screeen.dart';
import 'package:riyapola_app/screens/login_screen.dart';
import 'package:riyapola_app/screens/main_screen.dart';
import 'package:riyapola_app/widgets/dialogbox/custom_dialogbox.dart';
import '../screens/user_profile_screen.dart';

class AuthService {
  var context;


  void showDialogBox() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return const CustomDialogBox(
            title: "Error!",
            descriptions: "Invalid Credentials!",
            text: "OK",
          );
        });
  }

  final FirebaseAuth _auth;

  AuthService(this._auth);

  Stream<User?> get authStateChanges => _auth.idTokenChanges();

  Future<String?> login(BuildContext context, String email, String password) async {
    try{
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      print("Logged IN");
      // Navigator.of(context).pushNamed('/user_profile_screen');
      Navigator.of(context).push(MaterialPageRoute(
          builder: (_){
            return MainScreen();
          }
      ));
      return "Logged In";
    } catch(e) {
      print("4543554355"+e.toString()+ "4543554355");
      return "-1";
    }
  }

  Future<String?> signUp(BuildContext context, String email, String password,String name, String mobile) async {
    try{
      await _auth.createUserWithEmailAndPassword(email: email, password: password).then((value) async {
        User? user = FirebaseAuth.instance.currentUser;

        await FirebaseFirestore.instance.collection("users").doc(user!.uid).set({
          'uid': user.uid,
          'email': email,
          'name' : name,
          'mobile' : mobile,
        });
      });
      Navigator.of(context).push(MaterialPageRoute(
          builder: (_){
            return MainScreen();
          }
      ));
      print("Register successful");

      //final responseData = json.decode(response.body);
      return "Signed Up";
    } catch(e) {
      print(e.toString());
      return "-1";
      // throw e;
    }
  }
}