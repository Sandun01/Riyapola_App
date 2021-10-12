import "package:flutter/material.dart";
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ViewMyAdvertiseMent extends StatefulWidget {
  ViewMyAdvertiseMent({Key? key}) : super(key: key);

  @override
  _ViewMyAdvertiseMentState createState() => _ViewMyAdvertiseMentState();
}

class _ViewMyAdvertiseMentState extends State<ViewMyAdvertiseMent> {
  String _id = "";
  String _title = "";
  String _price = "";
  String _category = "";
  String _location = "";
  String _description = "";
  String _imageURL = "";
  String _seller = "Nilan Meegoda";
  String _ratingVal = "";

  void _onclickViewSellerProfile(BuildContext ctx) {
    print("_onclickViewSellerProfile");
    Navigator.of(ctx).pushNamed(
      '/seller-profile',
      arguments: {},
    );
  }

  void _onclickChatWithSeller(BuildContext ctx) {
    print("_onclickChatWithSeller");
    Navigator.of(ctx).pushNamed(
      '/single-chat-view',
      arguments: {},
    );
  }

  void _onclickEditAdd(BuildContext ctx, String id) {
    Navigator.of(ctx).pushNamed(
      '/edit-add',
      arguments: {
        'id': id,
      },
    );
  }

  ///delete function
  showAlertDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = FlatButton(
      child: const Text("Cancel"),
      onPressed: () {
        Navigator.of(context).pushNamed(
          '/view-my-add',
          arguments: {
            'id': _id,
          },
        );
      },
    );
    Widget continueButton = FlatButton(
      child: const Text("Confirm"),
      onPressed: () async {
        await FirebaseFirestore.instance
            .collection('ads')
            .doc(_id)
            .delete()
            .then(
          (value) {
            print("Advertisement Deleted");
            Navigator.of(context).pushNamed(
              '/my-ads',
            );
          },
        ).catchError((e) {
          print(e);
        });
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text("Warning !"),
      content: const Text("Do you want to Delete your Advertisement"),
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

  //build
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;

    final add_id = routeArgs['id'];
    _id = add_id!;

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
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          margin: const EdgeInsets.only(
            right: 20.0,
            left: 20.0,
            top: 10.0,
            bottom: 10.0,
          ),
          elevation: 5,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
//------------------------Ads---------------------------------------------
              Column(children: <Widget>[
                StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('ads')
                        .doc(add_id)
                        .snapshots(),
                    builder: (BuildContext context,
                        AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>>
                            snapshot) {
                      if (!snapshot.hasData) {
                        return Text('Loading data ... Please Wait ...');
                      }
                      if (snapshot.hasError) {
                        return Text('Something went wrong');
                      }

                      _title = snapshot.data!['title'];
                      _price = snapshot.data!['price'].toString();
                      _location = snapshot.data!['location'];
                      _description = snapshot.data!['description'];
                      _imageURL = snapshot.data!['imageUrl'];
                      _category = snapshot.data!['category'];
                      // _description = adsDocument!['description'];
                      // _seller = adsDocument[''];
                      // _ratingVal = adsDocument['rating'];

                      print(add_id);

                      return Column(
                        children: [
                          //Title
                          Container(
                            alignment: Alignment.centerLeft,
                            padding: const EdgeInsets.only(
                              top: 20.0,
                              left: 30.0,
                            ),
                            child: Text(
                              _title,
                              style: const TextStyle(
                                // fontWeight: FontWeight.bold,
                                fontSize: 30,
                                // fontFamily: "AguafinaScript",
                              ),
                            ),
                          ),
                          //.
                          //.
                          //Image
                          Container(
                            alignment: Alignment.center,
                            width: double.infinity,
                            // height: 200,
                            // color: Colors.amber,
                            child: Image.network(_imageURL),
                          ),
                          //.
                          //.
                          //other details
                          Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                //..
                                //..
                                //title
                                Container(
                                  alignment: Alignment.centerLeft,
                                  // color: Colors.amber,
                                  width: double.infinity,
                                  margin: const EdgeInsets.only(
                                    top: 10.0,
                                  ),
                                  padding: const EdgeInsets.only(
                                    left: 30.0,
                                    right: 20.0,
                                  ),
                                  // color: Colors.amber,
                                  child: Text(
                                    "Title: " + _title,
                                    style: const TextStyle(
                                      // fontWeight: FontWeight.bold,
                                      fontSize: 18.0,
                                    ),
                                  ),
                                ),
                                //..
                                //..
                                //Category
                                Container(
                                  alignment: Alignment.centerLeft,
                                  // color: Colors.amber,
                                  width: double.infinity,
                                  margin: const EdgeInsets.only(
                                    top: 10.0,
                                  ),
                                  padding: const EdgeInsets.only(
                                    left: 30.0,
                                    right: 20.0,
                                  ),
                                  // color: Colors.amber,
                                  child: Text(
                                    "Category: " + _category,
                                    style: const TextStyle(
                                      // fontWeight: FontWeight.bold,
                                      fontSize: 18.0,
                                    ),
                                  ),
                                ),
                                //..
                                //..
                                //price
                                Container(
                                  alignment: Alignment.centerLeft,
                                  // color: Colors.amber,
                                  width: double.infinity,
                                  margin: const EdgeInsets.only(
                                    top: 10.0,
                                  ),
                                  padding: const EdgeInsets.only(
                                    left: 30.0,
                                    right: 20.0,
                                  ),
                                  // color: Colors.amber,
                                  child: Text(
                                    "Price: Rs." + _price,
                                    style: const TextStyle(
                                      // fontWeight: FontWeight.bold,
                                      fontSize: 18.0,
                                    ),
                                  ),
                                ),
                                //..
                                //..
                                //description
                                Container(
                                  alignment: Alignment.centerLeft,
                                  // color: Colors.amber,
                                  width: double.infinity,
                                  margin: const EdgeInsets.only(
                                    top: 10.0,
                                  ),
                                  padding: const EdgeInsets.only(
                                    left: 30.0,
                                    right: 20.0,
                                  ),
                                  // color: Colors.amber,
                                  child: Text(
                                    "Description: " + _description,
                                    style: const TextStyle(
                                      // fontWeight: FontWeight.bold,
                                      fontSize: 18.0,
                                    ),
                                  ),
                                ),
                                //..
                                //..
                                //location
                                Container(
                                  alignment: Alignment.centerLeft,
                                  // color: Colors.amber,
                                  width: double.infinity,
                                  margin: const EdgeInsets.only(
                                    top: 10.0,
                                    bottom: 10.0,
                                  ),
                                  padding: const EdgeInsets.only(
                                    left: 30.0,
                                    right: 20.0,
                                  ),
                                  // color: Colors.amber,
                                  child: Text(
                                    "Location: " + _location,
                                    style: const TextStyle(
                                      // fontWeight: FontWeight.bold,
                                      fontSize: 18.0,
                                    ),
                                    // ),
                                  ),
                                ),

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                      alignment: Alignment.center,
                                      padding: const EdgeInsets.only(
                                        top: 10.0,
                                        bottom: 10.0,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 10.0,
                                        ),
                                        child: ElevatedButton(
                                          child: const Text(
                                            'Edit',
                                            style: TextStyle(
                                              color: Colors.blue,
                                              // fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          onPressed: () {
                                            _onclickEditAdd(context, add_id);
                                          },
                                          style: ElevatedButton.styleFrom(
                                            shadowColor: Colors.blue,
                                            primary: Colors.white,
                                            side: const BorderSide(
                                              color: Colors.blue,
                                              width: 2,
                                            ),
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 30, vertical: 8),
                                          ),
                                        ),
                                      ),
                                    ),

                                    //delete button
                                    Container(
                                      alignment: Alignment.center,
                                      padding: const EdgeInsets.only(
                                        top: 10.0,
                                        bottom: 10.0,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 10.0,
                                        ),
                                        child: ElevatedButton(
                                          child: const Text(
                                            'Delete',
                                            style: TextStyle(
                                              color: Colors.red,
                                              // fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          onPressed: () {
                                            showAlertDialog(context);
                                          },
                                          style: ElevatedButton.styleFrom(
                                            shadowColor: Colors.red,
                                            primary: Colors.white,
                                            side: const BorderSide(
                                              color: Colors.red,
                                              width: 2,
                                            ),
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 30, vertical: 8),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ]), //
                        ],
                      );
                    }),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
