import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import '../widgets/buttons/image_input.dart';
import '../models/advertisement.dart';
import '../widgets/buttons/form_selector.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:firebase_storage/firebase_storage.dart';
import '../widgets/dialogbox/custom_dialogbox.dart';
import 'package:progress_dialog/progress_dialog.dart';

class PostAdvertisement extends StatefulWidget {
  const PostAdvertisement({Key? key}) : super(key: key);

  @override
  _PostAdvertisementState createState() => _PostAdvertisementState();
}

class _PostAdvertisementState extends State<PostAdvertisement> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final FirebaseAuth auth = FirebaseAuth.instance;
  final _storage = FirebaseStorage.instance;
  late final ProgressDialog progressDialog;

  String _dropdownValue = '';
  late File? _userImafeFile = null;

  var _postAdData = Advertisement(
    id: '',
    title: '',
    price: 0,
    category: '',
    description: '',
    location: '',
    imageUrl: '',
    user: '',
  );

  void _pickedImage(File image) {
    _userImafeFile = image;
  }

  void setDropdownValue(String val) {
    _postAdData = Advertisement(
      id: '',
      title: _postAdData.title,
      description: _postAdData.description,
      price: _postAdData.price,
      category: val.toString(),
      location: _postAdData.location,
    );
    // print("2:" + _postAdData);
    _dropdownValue = val;
  }

  String getUserId() {
    final User? user = auth.currentUser;
    final uid = user!.uid;
    return uid;
  }

  //upload image to firebase
  Future<String> _upload_image_firebase() async {
    DateTime now = DateTime.now();
    String dateTime = now.toString();
    //Upload to Firebase
    var snapshot =
        await _storage.ref().child('Ads/' + dateTime).putFile(_userImafeFile!);

    var imgUrl = await snapshot.ref.getDownloadURL();

    return imgUrl;
  }

  //save form data
  void _saveFormData() async {
    final isValid = _formKey.currentState!.validate();
    if (_postAdData.category == '') {
      final snackBar = SnackBar(
        content: const Text('Please select a category'),
        action: SnackBarAction(
          label: 'Ok',
          onPressed: () {
            // Some code to undo the change.
          },
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else if (_userImafeFile == null) {
      final snackBar = SnackBar(
        content: const Text('Please pick an image.'),
        backgroundColor: Theme.of(context).errorColor,
        action: SnackBarAction(
          label: '',
          onPressed: () {
            // Some code to undo the change.
          },
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return;
    } else if (!isValid) {
      return;
    }

    // save form data if valid
    _formKey.currentState!.save();

    //show progress dialog
    showProgressDialog();

    //upload image && set url
    var img_url = await _upload_image_firebase();
    print("image URL:" + img_url);

    _postAdData.imageUrl = img_url;

    //set user id
    var id = getUserId();
    _postAdData.user = id;

    // print(_postAdData.title);

    //progress set dialogbox
    progressDialog.update(
      message: 'Data Uploaded!',
      progress: 90.0,
    );

    //upload data to firestore
    handle_submit_data(_postAdData);
  }

  //add data to database
  void handle_submit_data(_postAdData) {
    CollectionReference ads = FirebaseFirestore.instance.collection('ads');

    //progress set dialogbox
    progressDialog.update(
      message: 'Data Uploaded!',
      progress: 99.0,
    );

    ads.add({
      'title': _postAdData.title,
      'description': _postAdData.description,
      'price': _postAdData.price,
      'category': _postAdData.category,
      'location': _postAdData.location,
      'imageUrl': _postAdData.imageUrl,
      'user': _postAdData.user,
    }).then(
      (value) {
        print("Advertisement Added");
        hideProgressDialog();
        //show final diaolg
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return CustomDialogBox(
                title: "Success!",
                descriptions: "Your New Advertisement Posted Successfully!",
                text: "OK",
                route: "/my-ads",
              );
            });
      },
    ).catchError((error) => print("Failed to add Advertisement: $error"));
  }

  void showProgressDialog() {
    progressDialog.style(
      message: 'Uploading Data...',
      progress: 40.0,
    );
    progressDialog.show();
  }

  void hideProgressDialog() {
    progressDialog.hide();
  }

  @override
  Widget build(BuildContext context) {
    progressDialog = ProgressDialog(
      context,
      type: ProgressDialogType.Download,
      isDismissible: true,
    );

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          elevation: 0,
          title: const Padding(
            padding: EdgeInsets.only(
              top: 20.0,
              bottom: 20.0,
            ),
            child: Text(
              "RiyaPola",
              // textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
              ),
            ),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                ClipPath(
                  clipper: PostAddClipper(),
                  child: Container(
                    width: double.infinity,
                    // height: 620,
                    decoration: const BoxDecoration(color: Colors.blue),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20.0, top: 40.0, right: 20.0, bottom: 0.0),
                          child: Row(
                            children: const [
                              Text(
                                "Post Advertisement",
                                style: TextStyle(
                                  shadows: [
                                    Shadow(
                                        color: Colors.white,
                                        offset: Offset(0, -10))
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
                            left: 20.0,
                            right: 20.0,
                          ),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                //image
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: 20,
                                  ),
                                  child: ImageInput(_pickedImage),
                                ),

                                //title
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 10,
                                  ),
                                  child: TextFormField(
                                    maxLength: 20,
                                    decoration: const InputDecoration(
                                      icon: Icon(
                                        Icons.text_fields,
                                        color: Colors.white,
                                        size: 35.0,
                                      ),
                                      hintText: "Enter Your Title Here",
                                      hintStyle: TextStyle(
                                        color: Colors.white,
                                      ),
                                      labelText: "Title",
                                      labelStyle: TextStyle(
                                        color: Colors.white,
                                      ),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white),
                                      ),
                                      border: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white),
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Title cannot be empty';
                                      }
                                      return null;
                                    },
                                    style: const TextStyle(
                                      color: Colors.white,
                                    ),
                                    onSaved: (value) {
                                      _postAdData = Advertisement(
                                        id: '',
                                        title: value.toString(),
                                        description: _postAdData.description,
                                        price: _postAdData.price,
                                        category: _postAdData.category,
                                        location: _postAdData.location,
                                      );
                                    },
                                  ),
                                ),

                                //------ Category -----
                                Row(
                                  children: <Widget>[
                                    Expanded(
                                      // child: FormSelector(selectedCategory),
                                      child: FormSelector(setDropdownValue),
                                    ),
                                  ],
                                ),
                                // Price
                                Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: TextFormField(
                                        decoration: const InputDecoration(
                                          icon: Icon(
                                            Icons.monetization_on,
                                            color: Colors.white,
                                            size: 35.0,
                                          ),
                                          hintText: "Enter Your Price",
                                          hintStyle: TextStyle(
                                            color: Colors.white,
                                          ),
                                          labelText: "Price",
                                          labelStyle: TextStyle(
                                            color: Colors.white,
                                          ),
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide:
                                                BorderSide(color: Colors.white),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide:
                                                BorderSide(color: Colors.white),
                                          ),
                                          border: UnderlineInputBorder(
                                            borderSide:
                                                BorderSide(color: Colors.white),
                                          ),
                                        ),
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'Price cannot be empty';
                                          }
                                          if (double.tryParse(value) == null) {
                                            return 'Please enter valid price';
                                          }
                                          if (double.parse(value) < 0) {
                                            return 'Please enter valid price';
                                          }
                                          return null;
                                        },
                                        style: const TextStyle(
                                          color: Colors.white,
                                        ),
                                        onSaved: (value) {
                                          _postAdData = Advertisement(
                                            id: '',
                                            title: _postAdData.title,
                                            description:
                                                _postAdData.description,
                                            price:
                                                double.parse(value.toString()),
                                            category: _postAdData.category,
                                            location: _postAdData.location,
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),

                                //description
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 20,
                                  ),
                                  child: TextFormField(
                                    keyboardType: TextInputType.multiline,
                                    maxLines: 4,
                                    maxLength: 350,
                                    decoration: const InputDecoration(
                                      icon: Icon(
                                        Icons.description,
                                        color: Colors.white,
                                        size: 35.0,
                                      ),
                                      hintText: "Enter Your Description Here",
                                      hintStyle: TextStyle(
                                        color: Colors.white,
                                      ),
                                      labelText: "Description",
                                      labelStyle: TextStyle(
                                        color: Colors.white,
                                      ),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white),
                                      ),
                                      border: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white),
                                      ),
                                      filled: true,
                                      fillColor: Colors.white30,
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Description cannot be empty';
                                      }
                                      return null;
                                    },
                                    style: const TextStyle(
                                      color: Colors.white,
                                    ),
                                    onSaved: (value) {
                                      _postAdData = Advertisement(
                                        id: '',
                                        title: _postAdData.title,
                                        description: value.toString(),
                                        price: _postAdData.price,
                                        category: _postAdData.category,
                                        location: _postAdData.location,
                                      );
                                    },
                                  ),
                                ),

                                //location
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 0.0,
                                    vertical: 5.0,
                                  ),
                                  child: TextFormField(
                                    decoration: const InputDecoration(
                                      icon: Icon(
                                        Icons.location_on,
                                        color: Colors.white,
                                        size: 35.0,
                                      ),
                                      hintText: "Select Location",
                                      hintStyle: TextStyle(
                                        color: Colors.white,
                                      ),
                                      labelText: "Location",
                                      labelStyle: TextStyle(
                                        color: Colors.white,
                                      ),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white),
                                      ),
                                      border: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white),
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Description cannot be empty';
                                      }
                                      return null;
                                    },
                                    style: const TextStyle(
                                      color: Colors.white,
                                    ),
                                    onSaved: (value) {
                                      _postAdData = Advertisement(
                                        id: '',
                                        title: _postAdData.title,
                                        description: _postAdData.description,
                                        price: _postAdData.price,
                                        category: _postAdData.category,
                                        location: value.toString(),
                                      );
                                    },
                                  ),
                                ),

                                //Post button
                                Center(
                                  child: Container(
                                    margin: const EdgeInsets.only(
                                      top: 30.0,
                                      bottom: 30.0,
                                    ),
                                    height: 45.0,
                                    width: 100.0,
                                    child: ElevatedButton(
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateColor.resolveWith(
                                          (states) => Colors.black,
                                        ),
                                        shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(18.0),
                                          ),
                                        ),
                                      ),
                                      // onPressed: showProgressDialog,
                                      // // () {
                                      //   testDialog;
                                      //show dialog
                                      // showDialog(
                                      //     context: context,
                                      //     builder: (BuildContext context) {
                                      //       return CustomDialogBox(
                                      //         title: "Success!",
                                      //         descriptions:
                                      //             "Your New Advertisement Posted Successfully!",
                                      //         text: "OK",
                                      //       );
                                      //     });
                                      // },
                                      onPressed: _saveFormData,
                                      child: const Text(
                                        'POST',
                                        style: TextStyle(color: Colors.white),
                                      ),
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
                ),
              ],
            ),
          ),
        ));
  }
}

class PostAddClipper extends CustomClipper<Path> {
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
