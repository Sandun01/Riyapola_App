import 'dart:async';
import 'package:flutter/material.dart';
import '../widgets/buttons/image_input.dart';

class EditAdvertisement extends StatefulWidget {
  const EditAdvertisement({Key? key}) : super(key: key);

  @override
  _EditAdvertisementState createState() => _EditAdvertisementState();
}

class _EditAdvertisementState extends State<EditAdvertisement> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late String _addTitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        elevation: 0,
        title: const Center(
          child: Padding(
            padding: EdgeInsets.only(top: 20.0),
            child: Text(
              "RiyaPola",
              style: TextStyle(
                color: Colors.white,
                fontSize: 40,
              ),
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
                        key: _formKey,
                        child: Column(
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
                              child: const Image(
                                image: AssetImage(
                                  'assets/images/sample_vehicle.jpg',
                                ),
                                height: 300,
                                width: 300,
                              ),
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
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                  border: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
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
                                initialValue: "LAND CRUISER V8",
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                                onSaved: (value) {
                                  _addTitle = value.toString();
                                },
                              ),
                            ),

                            //------ Category and price -----
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: TextFormField(
                                    decoration: const InputDecoration(
                                      icon: Icon(
                                        Icons.widgets,
                                        color: Colors.white,
                                        size: 35.0,
                                      ),
                                      hintText: "Select Category",
                                      hintStyle: TextStyle(
                                        color: Colors.white,
                                      ),
                                      labelText: "Category",
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
                                        return 'Category cannot be empty';
                                      }
                                      return null;
                                    },
                                    style: const TextStyle(
                                      color: Colors.white,
                                    ),
                                    initialValue: "Vehicles",
                                    onSaved: (value) {
                                      _addTitle = value.toString();
                                    },
                                  ),
                                ),
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
                                      filled: true,
                                      fillColor: Colors.white30,
                                    ),
                                    // validator: (value) {
                                    //   if (value == null) {
                                    //     return 'Price cannot be empty';
                                    //   }
                                    //   return null;
                                    // },
                                    style: const TextStyle(
                                      color: Colors.white,
                                    ),
                                    initialValue: "8000 0000",
                                    onSaved: (value) {
                                      _addTitle = value.toString();
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
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                  border: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
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
                                initialValue:
                                    "The Land Cruiser’s robust build and durability has tackled on the most challenging desert tracks and mountain ranges. But the Land Cruiser is not just about tough protection, it offers a comfortable, peaceful drive thanks to sound-absorbing and noise-cancelling materials.",
                                onSaved: (value) {
                                  _addTitle = value.toString();
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
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                  border: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
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
                                initialValue: "Colombo",
                                onSaved: (value) {
                                  _addTitle = value.toString();
                                },
                              ),
                            ),

                            //spacing
                            const SizedBox(
                              width: double.infinity,
                              height: 50.0,
                            ),
                          ],
                        ),
                      ),
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
                      onPressed: () {},
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
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10.0,
                    ),
                    child: ElevatedButton(
                      child: const Text(
                        'DELETE',
                        style: TextStyle(
                          color: Colors.red,
                          // fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          shadowColor: Colors.red,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          primary: Colors.white,
                          side: const BorderSide(
                            color: Colors.red,
                            width: 2,
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 8),
                          textStyle: const TextStyle(
                            fontSize: 20,
                          )),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
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
