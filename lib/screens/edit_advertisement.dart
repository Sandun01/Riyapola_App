import 'dart:async';
import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:riyapola_app/screens/my_advertisements.dart';
import 'package:riyapola_app/widgets/buttons/form_selector.dart';
import '../widgets/buttons/image_input.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models//advertisement.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:progress_dialog/progress_dialog.dart';
import '../widgets/dialogbox/custom_dialogbox.dart';

class EditAdvertisement extends StatefulWidget {
  const EditAdvertisement({Key? key}) : super(key: key);

  @override
  _EditAdvertisementState createState() => _EditAdvertisementState();
}

class _EditAdvertisementState extends State<EditAdvertisement> {
  final GlobalKey<FormState> _formKeyEditAdd = GlobalKey<FormState>();
  late final ProgressDialog progressDialog;
  String _id = "";
  double _price = 0;
  String _addTitle = "";
  String _category = "";
  String _user = "";
  String _location = "";
  String _description = "";
  String _imageURL = "";
  String _seller = "Nilan Meegoda";
  String _dropdownValue = "";

  var _editAdData = Advertisement(
    id: '',
    title: '',
    price: 0,
    category: '',
    description: '',
    location: '',
    imageUrl: '',
    user: '',
  );

  void setDropdownValue(String val) {
    _editAdData = Advertisement(
      id: _id,
      title: _editAdData.title,
      user: _editAdData.user,
      imageUrl: _editAdData.imageUrl,
      description: _editAdData.description,
      price: _editAdData.price,
      category: val.toString(),
      location: _editAdData.location,
    );
    // print("2:" + _editAdData);
    _dropdownValue = val;
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

//update function
  void _updateData() {
    _formKeyEditAdd.currentState!.save();
    // print(_editAdData.category);
    // print(_editAdData.id);
    // print(_editAdData.title);
    // print(_editAdData.price);
    // print(_editAdData.imageUrl);
    // print(_editAdData.user);
    // print(_editAdData.description);
    // print(_editAdData.location);

    FirebaseFirestore.instance.collection('ads').doc(_id).set({
      'title': _editAdData.title,
      'description': _editAdData.description,
      'price': _editAdData.price,
      'category': _editAdData.category,
      'location': _editAdData.location,
      'imageUrl': _imageURL,
      'user': _user,
    }).then((value) {
      hideProgressDialog();
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return CustomDialogBox(
              title: "Success!",
              descriptions: "Your Advertisement Updated Successfully!",
              text: "OK",
              route: "/my-ads",
            );
          });
    }).catchError((e) {
      print(e);
    });
  }

  void navigateToMyAds(context) {
    Navigator.of(context).pushNamed('/my-ads');
  }

  ///
  // ///delete function
  // showAlertDialog(BuildContext context) {
  //   // set up the buttons
  //   Widget cancelButton = FlatButton(
  //     child: const Text("Cancel"),
  //     onPressed: () {
  //       Navigator.of(context).pushNamed(
  //         '/view-my-add',
  //         arguments: {
  //           'id': _id,
  //         },
  //       );
  //     },
  //   );
  //   Widget continueButton = FlatButton(
  //     child: const Text("Confirm"),
  //     onPressed: () async {
  //       await FirebaseFirestore.instance
  //           .collection('ads')
  //           .doc(_id)
  //           .delete()
  //           .then(
  //         (value) {
  //           print("Advertisement Deleted");
  //           Navigator.of(context).pushNamed(
  //             '/my-ads',
  //           );
  //         },
  //       ).catchError((e) {
  //         print(e);
  //       });
  //     },
  //   );
  //   // set up the AlertDialog
  //   AlertDialog alert = AlertDialog(
  //     title: const Text("Warning !"),
  //     content: const Text("Do you want to Delete your Advertisement"),
  //     actions: [
  //       cancelButton,
  //       continueButton,
  //     ],
  //   );

  //   // show the dialog
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return alert;
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    progressDialog = ProgressDialog(
      context,
      type: ProgressDialogType.Download,
      isDismissible: true,
    );
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;

    final add_id = routeArgs['id'];
    _id = add_id!;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        elevation: 0,
        title: const Padding(
          padding: EdgeInsets.only(top: 20.0),
          child: Text(
            "RiyaPola",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: <Widget>[
          ClipPath(
            clipper: EditAddClipper(),
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
                          "Edit Advertisement",
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
                      left: 20.0,
                      right: 20.0,
                    ),
                    child: Form(
                      key: _formKeyEditAdd,
                      child: StreamBuilder(
                          stream: FirebaseFirestore.instance
                              .collection('ads')
                              .doc(add_id)
                              .snapshots(),
                          builder: (BuildContext context,
                              AsyncSnapshot<
                                      DocumentSnapshot<Map<String, dynamic>>>
                                  snapshot) {
                            if (!snapshot.hasData) {
                              return const Text(
                                  'Loading data ... Please Wait ...');
                            }
                            if (snapshot.hasError) {
                              return const Text('Something went wrong');
                            }

                            _addTitle = snapshot.data!['title'];
                            _price = snapshot.data!['price'];
                            _location = snapshot.data!['location'];
                            _description = snapshot.data!['description'];
                            _imageURL = snapshot.data!['imageUrl'];
                            _user = snapshot.data!['user'];
                            _category = snapshot.data!['category'];

                            _editAdData.title = _addTitle;
                            _editAdData.price = _price;
                            _editAdData.description = _description;
                            _editAdData.category = _category;
                            _editAdData.imageUrl = _imageURL;
                            _editAdData.user = _user;
                            _editAdData.location = _location;

                            // _ratingVal = adsDocument['rating'];

                            print(add_id);
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                //image
                                Container(
                                  width: double.infinity,
                                  height: 150,
                                  margin: const EdgeInsets.only(
                                    top: 10.0,
                                    bottom: 10.0,
                                  ),
                                  padding: const EdgeInsets.only(
                                    top: 10,
                                    bottom: 10,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.white30,
                                    border: Border.all(
                                      width: 1,
                                      color: Colors.white54,
                                    ),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(
                                        20.0,
                                      ),
                                    ),
                                  ),
                                  child: Image.network(_imageURL),
                                  alignment: Alignment.center,
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
                                      filled: true,
                                      fillColor: Colors.white30,
                                    ),
                                    validator: (value) {
                                      if (value == null) {
                                        return 'Title cannot be empty';
                                      }
                                      return null;
                                    },
                                    initialValue: _addTitle,
                                    style: const TextStyle(
                                      color: Colors.white,
                                    ),
                                    onSaved: (value) {
                                      _editAdData = Advertisement(
                                        id: _id,
                                        title: value.toString(),
                                        description: _editAdData.description,
                                        price: _editAdData.price,
                                        category: _editAdData.category,
                                        location: _editAdData.location,
                                      );
                                    },
                                  ),
                                ),

                                //------ Category and price -----
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
                                          _editAdData = Advertisement(
                                            id: _id,
                                            title: _editAdData.title,
                                            description:
                                                _editAdData.description,
                                            price:
                                                double.parse(value.toString()),
                                            category: _editAdData.category,
                                            location: _editAdData.location,
                                          );
                                        },
                                        initialValue: _price.toString(),
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
                                      if (value == null) {
                                        return 'Description cannot be empty';
                                      }
                                      return null;
                                    },
                                    style: const TextStyle(
                                      color: Colors.white,
                                    ),
                                    initialValue: _description,
                                    onSaved: (value) {
                                      _editAdData = Advertisement(
                                        id: _id,
                                        title: _editAdData.title,
                                        description: value.toString(),
                                        price: _editAdData.price,
                                        category: _editAdData.category,
                                        location: _editAdData.location,
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
                                      filled: true,
                                      fillColor: Colors.white30,
                                    ),
                                    validator: (value) {
                                      if (value == null) {
                                        return 'Location cannot be empty';
                                      }
                                      return null;
                                    },
                                    style: const TextStyle(
                                      color: Colors.white,
                                    ),
                                    initialValue: _location,
                                    onSaved: (value) {
                                      _editAdData = Advertisement(
                                        id: _id,
                                        title: _editAdData.title,
                                        description: _editAdData.description,
                                        price: _editAdData.price,
                                        category: _editAdData.category,
                                        location: value.toString(),
                                      );
                                    },
                                  ),
                                ),

                                //spacing
                                const SizedBox(
                                  width: double.infinity,
                                  height: 50.0,
                                ),
                              ],
                            );
                          }),
                    ),
                    // delete_loading == false && ()
                  ),
                ],
              ),
            ),
          ),

          //All buttons
          Container(
            margin: const EdgeInsets.only(
              bottom: 20.0,
            ),
            height: 45.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10.0,
                  ),
                  child: ElevatedButton(
                    child: const Text('UPDATE'),
                    onPressed: _updateData,
                    style: ElevatedButton.styleFrom(
                        shadowColor: Colors.black,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0)),
                        primary: Colors.black,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 8),
                        textStyle: const TextStyle(
                          fontSize: 20,
                        )),
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.symmetric(
                //     horizontal: 10.0,
                //   ),
                //   child: ElevatedButton(
                //     child: const Text(
                //       'DELETE',
                //       style: TextStyle(
                //         color: Colors.red,
                //         // fontWeight: FontWeight.bold,
                //       ),
                //     ),
                //     onPressed: () {
                //       showAlertDialog(context);
                //       // deleteAd();
                //     },
                //     style: ElevatedButton.styleFrom(
                //         shadowColor: Colors.red,
                //         shape: RoundedRectangleBorder(
                //           borderRadius: BorderRadius.circular(30.0),
                //         ),
                //         primary: Colors.white,
                //         side: const BorderSide(
                //           color: Colors.red,
                //           width: 2,
                //         ),
                //         padding: const EdgeInsets.symmetric(
                //             horizontal: 30, vertical: 8),
                //         textStyle: const TextStyle(
                //           fontSize: 20,
                //         )),
                //   ),
                // ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}

class EditAddClipper extends CustomClipper<Path> {
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
