import 'dart:collection';
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:riyapola_app/screens/login_screen.dart';
import 'package:riyapola_app/screens/splash_screen.dart';
import 'package:riyapola_app/widgets/dialogbox/custom_dialogbox.dart';

const double iconsize = 35;

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController confirmpasswordController = new TextEditingController();
  TextEditingController nameController = new TextEditingController();
  TextEditingController mobileController = new TextEditingController();
  var email;
  var name;
  var mobile;
  late bool _passwordVisible = true;

  get data => null;

  Object? get item => null;

  void initState(){
    super.initState();
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;
    // ignore: unnecessary_null_comparison
    if(user == null){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => Login()));
    }
    // readItems();
    // email = "";
    // name = "";
    // mobile = "";
    // _passwordVisible = false;

    // WidgetsBinding.instance!.addPostFrameCallback((_){
    //   _getUserdata();
    // });

  }

  // Future<void> _getUserdata() async{
  //
  //   final FirebaseAuth auth = FirebaseAuth.instance;
  //   final User? user = auth.currentUser;
  //   final uid = user!.uid;
  //
  //   final DocumentReference = await FirebaseFirestore.instance
  //       .collection('users')
  //       .doc(uid)
  //       .get().then((querySnapshot) {
  //       Map<String, dynamic>? user = querySnapshot.data();
  //       print(user!['email']);
  //
  //         email = user['email'];
  //         name = user['name'];
  //         mobile = user['mobile'];
  //     });
  //
  //     // print()
  //     //   .then((DocumentSnapshot documentSnapshot) {
  //     // if (documentSnapshot.exists) {
  //     //   print('Document exists on the database');
  //     // }
  //     // print("59606786578560978097865097865097865097865097865097");
  //     // // Object? userdata = documentSnapshot.data();
  //     //
  //     // Map<dynamic, dynamic> map = documentSnapshot.data();
  //     //
  //     // // String username = (String) document.get("username");
  //     // // print(username);
  //     // //this._username = data["name"];
  //     // // print(userdata!.map().['name'].cast<String, dynamic>());
  //     // // print(userdata);
  //     // print(userdata);
  //     // // print(userdata.runtimeType);
  //     // Map<String, dynamic>.from(userdata);
  //     //
  //     // // final _username = List<dynamic>.from(
  //     // //   data.map<dynamic>(
  //     // //         (dynamic item) => userdata,
  //     // //   ),
  //     // // );
  //     // // print(_username[0]);
  //     // print("59606786578560978097865097865097865097865097865097");
  //     // print(userdata.runtimeType);
  //     // print(userdata);
  //     //
  //     //
  //     // print("59606786578560978097865097865097865097865097865097");
  //   // });
  //
  // }

  showAlertDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = FlatButton(
      child: Text("Cancel"),
      onPressed:  () {
        Navigator.of(context).pop(MaterialPageRoute(
            builder: (_){
              return Profile();
            }
        ));
      },
    );
    Widget continueButton = FlatButton(
      child: Text("Continue"),
      onPressed:  () {
        final FirebaseAuth auth = FirebaseAuth.instance;
        final User? user = auth.currentUser;
        // final uid = user!.uid;
        user!.delete();
        Navigator.of(context).push(MaterialPageRoute(
            builder: (_){
              return Login();
            }
        ));
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Alert !"),
      content: Text("Would you like to continue deleting your account"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }


  // void _updateData() {
  //   final FirebaseAuth auth = FirebaseAuth.instance;
  //   final User? user = auth.currentUser;
  //   final uid = user!.uid;
  //   FirebaseFirestore.instance.collection('users').doc(uid).set({
  //     'email': _editAdData.title,
  //     'mobile': _editAdData.description,
  //     'name': _editAdData.price,
  //     'uid': uid,
  //   }).then((value) {
  //     hideProgressDialog();
  //     showDialog(
  //         context: context,
  //         builder: (BuildContext context) {
  //           return CustomDialogBox(
  //             title: "Success!",
  //             descriptions: "Your Advertisement Updated Successfully!",
  //             text: "OK",
  //             route: "/my-ads",
  //           );
  //         });
  //   }).catchError((e) {
  //     print(e);
  //   });
  // }

  void _onClickPostAdd(BuildContext ctx) {
    print('Post ad BottonPress');
    Navigator.of(ctx).pushNamed(
      '/post-add',
      arguments: {},
    );
  }

  void _onClickMyAdds(BuildContext ctx) {
    print('My ads BottonPress');
    Navigator.of(ctx).pushNamed(
      '/my-ads',
      arguments: {},
    );
  }



  @override
  Widget build(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;
    final uid = user!.uid;
    return Scaffold(
      body: SingleChildScrollView(
          child:
        StreamBuilder(
          stream: FirebaseFirestore.instance.collection('users').doc(uid).snapshots(),
          builder: (BuildContext context,
              AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>> snapshot) {
            if (!snapshot.hasData) {
              return Text('Loading data ... Please Wait ...');
            }
            if (snapshot.hasError) {
              return Text('Something went wrong');
            }
            print(snapshot.data!['email']);
            print(snapshot.data!['name']);
            name = snapshot.data!['name'];
            email = snapshot.data!['email'];
            mobile = snapshot.data!['mobile'];
            // return ListView(
            //   children: snapshot.data!.docs.map((DocumentSnapshot document) {
            //     Map<String, dynamic> data =
            //         document.data()! as Map<String, dynamic>;
            //     return ListTile(
            //       title: Text(data['category']),
            //     );
            //   }).toList(),
            // );
            return CustomPaint(
              size: Size(MediaQuery.of(context).size.width,
                  (MediaQuery.of(context).size.width).toDouble()),
              painter: RPSCustomPainter(),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    // decoration: BoxDecoration(
                    //   image: const DecorationImage(
                    //       fit: BoxFit.fill,
                    //       image: AssetImage('assets/images/Vector 5.png')),
                    // ),
                    child: ListTile(
                      contentPadding: EdgeInsets.only(
                          left: 30.0, top: 50.0, right: 30.0, bottom: 20.0),
                      leading: Icon(Icons.account_circle_rounded,
                          color: Colors.white, size: 50.0),
                      title: Text(
                        snapshot.data!['name'],
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        'Welcome to Riyapola',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(5),
                              topRight: Radius.circular(5),
                              bottomLeft: Radius.circular(5),
                              bottomRight: Radius.circular(5)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        width: 75,
                        height: 90,
                        child: GestureDetector(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.add_circle_outline,
                                  size: iconsize,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 8),
                                  child: Text(
                                    "Post Ad",
                                    style: TextStyle(
                                        fontSize: 11, fontWeight: FontWeight.bold),
                                  ),
                                )
                              ],
                            ),
                          ),
                          onTap: () => _onClickPostAdd(context),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(5),
                              topRight: Radius.circular(5),
                              bottomLeft: Radius.circular(5),
                              bottomRight: Radius.circular(5)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        width: 75,
                        height: 90,
                        child: GestureDetector(
                          onTap: () => _onClickMyAdds(context),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.near_me_outlined,
                                  size: iconsize,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 8),
                                  child: Text(
                                    "My Ads",
                                    style: TextStyle(
                                        fontSize: 11, fontWeight: FontWeight.bold),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          print("Container clicked");
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(5),
                                topRight: Radius.circular(5),
                                bottomLeft: Radius.circular(5),
                                bottomRight: Radius.circular(5)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          width: 75,
                          height: 90,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.account_circle_outlined,
                                  size: iconsize,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 8),
                                  child: Text(
                                    "Edit Profile",
                                    style: TextStyle(
                                        fontSize: 11, fontWeight: FontWeight.bold),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          await FirebaseAuth.instance.signOut();
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (_){
                                return SplashScreen();
                              }
                          ));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(5),
                                topRight: Radius.circular(5),
                                bottomLeft: Radius.circular(5),
                                bottomRight: Radius.circular(5)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          width: 75,
                          height: 90,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.power_settings_new_outlined,
                                  size: iconsize,
                                  color: Colors.red.shade900,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 8),
                                  child: Text(
                                    "Logout",
                                    style: TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.red.shade900),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 20.0, top: 30.0, right: 20.0, bottom: 0.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, top: 20, bottom: 5),
                            child: TextFormField(
                              initialValue:name,
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.all(0),
                                icon: const Icon(Icons.person, color: Colors.black),
                                hintText: "Full Name",
                                hintStyle: TextStyle(
                                  color: Colors.black,
                                ),
                                labelText: "Full Name",
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
                                name = value.toString();
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 15.0),
                            child: TextFormField(
                              initialValue:mobile,
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.all(0),
                                icon: const Icon(Icons.mobile_friendly,
                                    color: Colors.black),
                                hintText: 'Mobile Number',
                                hintStyle: TextStyle(
                                  color: Colors.black,
                                ),
                                labelText: "Mobile Number",
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
                                name = value.toString();
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 5.0),
                            child: TextFormField(
                              initialValue:email,
                              decoration: const InputDecoration(
                                icon: const Icon(Icons.email, color: Colors.black),
                                hintText: 'Email',
                                hintStyle: TextStyle(
                                  color: Colors.black,
                                ),
                                labelText: "Email",
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
                                name = value.toString();
                              },
                            ),
                          ),
                          Padding(padding:const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding:const EdgeInsets.symmetric(
                                      horizontal: 5.0, vertical: 5.0),
                                  child: ElevatedButton(
                                    onPressed: (){
                                      showAlertDialog(context);
                                    },
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(30.0)),
                                      primary: Colors.white,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 12),
                                    ),
                                    child: Text(
                                      "Delete Account",
                                      style: TextStyle(
                                        fontSize: 14.0,
                                        color: Colors.black,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ),
                                ),

                                Padding(
                                  padding:const EdgeInsets.symmetric(
                                      horizontal: 5.0, vertical: 5.0),
                                  child: ElevatedButton(
                                    onPressed: (){

                                    },
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(30.0)),
                                      primary: Colors.black,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 22, vertical: 12),
                                    ),
                                    child: Text(
                                      "Save Changes",
                                      style: TextStyle(
                                        fontSize: 14.0,
                                        color: Colors.white,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ),
                                ),


                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),

      ),
    );
  }
}

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_0 = new Paint()
      ..color = Color.fromARGB(255, 125, 197, 255)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1.0;

    Path path_0 = Path();
    path_0.moveTo(0, size.height * 0.3);
    path_0.quadraticBezierTo(
        size.width * 0.85, size.height * 0.32, size.width, size.height * 0.8);
    path_0.lineTo(size.width, 0);
    path_0.lineTo(0, 0);
    path_0.quadraticBezierTo(0, size.height, 0, size.height);
    path_0.close();

    canvas.drawPath(path_0, paint_0);

    Paint paint_1 = new Paint()
      ..color = Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1.0;

    Path path_1 = Path();
    path_1.moveTo(0, size.height * 0.2);
    path_1.quadraticBezierTo(
        size.width * 0.9, size.height * 0.24, size.width, size.height * 0.8);
    path_1.lineTo(size.width, 0);
    path_1.lineTo(0, 0);
    path_1.quadraticBezierTo(0, size.height, 0, size.height);
    path_1.close();

    canvas.drawPath(path_1, paint_1);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
