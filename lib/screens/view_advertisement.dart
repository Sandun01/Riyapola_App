import "package:flutter/material.dart";
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ViewAdvertisement extends StatefulWidget {
  ViewAdvertisement({Key? key}) : super(key: key);

  @override
  _ViewAdvertisementState createState() => _ViewAdvertisementState();
}

class _ViewAdvertisementState extends State<ViewAdvertisement> {
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

  void _onclickAddFeedback(BuildContext ctx) {
    print("_onclickAddFeedback");
  }

  //build
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;

    final add_id = routeArgs['id'];
    final _title = routeArgs['title'];
    final _price = routeArgs['price'];

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

                      _location = snapshot.data!['location'];
                      _description = snapshot.data!['description'];
                      _imageURL = snapshot.data!['imageUrl'];
                      _category = snapshot.data!['category'];
                      // _description = adsDocument!['description'];
                      // _seller = adsDocument[''];
                      // _ratingVal = adsDocument['rating'];

                      // print(adsDocument!['aaa']);

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
                              _title!,
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
                                    "Price: Rs." + _price!,
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
                                //..
                                //..
                                //Seller
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
                                    "Seller: " + _seller,
                                    style: const TextStyle(
                                      // fontWeight: FontWeight.bold,
                                      fontSize: 18.0,
                                    ),
                                    // ),
                                  ),
                                ),
                              ]), //
                        ],
                      );
                    }),
              ]),

//------------------------Feedbacks---------------------------------------------
              Column(children: <Widget>[
                //..
                //..
                //Rating text
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
                    "Rating: " + _ratingVal,
                    style: const TextStyle(
                      // fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                ),
                //..
                //..
                //rating bar
                Container(
                  alignment: Alignment.centerLeft,
                  // color: Colors.amber,
                  width: double.infinity,
                  margin: const EdgeInsets.only(
                    top: 10.0,
                    bottom: 20.0,
                  ),
                  padding: const EdgeInsets.only(
                    left: 30.0,
                    right: 20.0,
                  ),
                  // color: Colors.amber,
                  child: RatingBar.builder(
                    initialRating: 3,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                  ),
                ),
                //..
                //..
                //View Seller button
                ElevatedButton.icon(
                  icon: const Icon(
                    Icons.account_circle,
                  ),
                  label: Text("Seller Profile"),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateColor.resolveWith(
                      (states) => Colors.black,
                    ),
                    textStyle: MaterialStateProperty.resolveWith(
                      (states) => const TextStyle(
                        // fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Averta',
                      ),
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  onPressed: () => _onclickViewSellerProfile(context),
                ),
                //Chat with Seller button
                ElevatedButton.icon(
                  icon: const Icon(
                    Icons.message,
                  ),
                  label: const Text("Chat wtih Seller"),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateColor.resolveWith(
                      (states) => Colors.black,
                    ),
                    textStyle: MaterialStateProperty.resolveWith(
                      (states) => const TextStyle(
                        // fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Averta',
                      ),
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  onPressed: () => _onclickChatWithSeller(context),
                ),
                // spacing
                const SizedBox(
                  width: double.infinity,
                  height: 20.0,
                ),
                //.
                //.
                //Feedbacks
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(
                    top: 20.0,
                    left: 30.0,
                  ),
                  child: const Text(
                    "Feedbacks",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
                //..
                //..
                //All Feedbacks
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(
                    top: 10.0,
                    bottom: 20.0,
                  ),
                  child: Column(
                    //all feedbacks
                    children: [
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        color: const Color(0xffD4D6FF),
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
                            ListTile(
                              title: Text(
                                _seller,
                                style: const TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                              subtitle: const Text(
                                "Great Job" + "...",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                //..
                //..
                //Add Feedbacks button
                Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.only(
                      top: 10.0,
                      bottom: 10.0,
                    ),
                    child: ElevatedButton(
                      onPressed: () => _onclickAddFeedback(context),
                      child: const Text(
                        "Write Feedback",
                        style: TextStyle(
                          fontFamily: 'Averta',
                        ),
                      ),
                    )),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
