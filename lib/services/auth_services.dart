
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:riyapola_app/screens/main_screen.dart';
import '../screens/user_profile_screen.dart';

class AuthService {
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
      print(e.toString());
      return e.toString();
    }
  }

  Future<String?> signUp(String email, String password,String name, String mobile) async {
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
      print("Register successful");
      return "Signed Up";
    } catch(e) {
      print(e.toString());
      return e.toString();
    }
  }
}