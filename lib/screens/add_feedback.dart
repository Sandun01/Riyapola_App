import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riyapola_app/widgets/feedbackDialog/custom_dialogbox.dart';


class AddFeedback extends StatefulWidget {
  const AddFeedback({Key? key}) : super(key: key);

  @override
  _AddFeedbackState createState() => _AddFeedbackState();
}

class _AddFeedbackState extends State<AddFeedback> {
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;

    //retrive UID
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;
    final _uid = user!.uid;

    final _title = routeArgs['title'];
    final _price = routeArgs['price'];
    final _id = routeArgs['id'];
    final _category = routeArgs['category'];
    final _location = routeArgs['location'];
    final _seller = routeArgs['seller'];
    
    final _productID = "prod1";//todo

    String defaultRat = "2.5";
    String? _feedback;
    double _rating = 2.5;

    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    validator() {
      if (_formKey.currentState != null && _formKey.currentState!.validate()) {
        print("validated");
        _formKey.currentState!.save();
        print(_feedback);
        print(_rating);

        CollectionReference Feedbacks =
            FirebaseFirestore.instance.collection('feedbacks');



        Feedbacks.add({
          'uid': _uid,
          'feedback': _feedback,
          'rating': _rating,
          'productID': _productID,
        }).then(
          (value) {
            print("Feedbacks Added");


            


            //show final diaolg
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return const CustomDialogBox(
                    title: "Success!",
                    descriptions: "Your Feedback Posted Successfully!",
                    text: "OK",
                  );
                });
          },
        ).catchError((error) => print("Failed to add feedbacks: $error"));
      } else
        print("not validated");
    }

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          elevation: 0,
          title: const Center(
            child: Padding(
              padding: EdgeInsets.only(
                top: 20.0,
                bottom: 20.0,
              ),
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
                child:
                    Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                  // .
                  // .
                  // Feedback - Title
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.only(
                      top: 20.0,
                      left: 30.0,
                    ),
                    child: Text(
                      "Feedback",
                      style: const TextStyle(
                        // fontWeight: FontWeight.bold,
                        fontSize: 40,
                        fontFamily: "AguafinaScript",
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
                    child: const Image(
                      image: AssetImage(
                        'assets/images/tesla-model3.png',
                      ),
                    ),
                  ),
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
                      "Title: " + _title!,
                      style: const TextStyle(
                        // fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                  //.
                  //.
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
                      "Category: " + _category!,
                      style: const TextStyle(
                        // fontWeight: FontWeight.bold,
                        fontSize: 20.0,
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
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                  //.
                  //.
                  // // spacing
                  const SizedBox(
                    width: double.infinity,
                    height: 20.0,
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
                      "Location: " + _location!,
                      style: const TextStyle(
                        // fontWeight: FontWeight.bold,
                        fontSize: 20.0,
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
                      "Seller: " + _seller!,
                      style: const TextStyle(
                        // fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                  //.
                  //.
                  // // spacing
                  const SizedBox(
                    width: double.infinity,
                    height: 20.0,
                  ),
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
                      "Rate Advertisement",
                      style: const TextStyle(
                        // fontWeight: FontWeight.bold,
                        fontSize: 20.0,
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
                      initialRating: double.parse(defaultRat),
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
                        _rating = rating;
                      },
                    ),
                  ),
                  //..
                  //.
                  //.
                  //feedback text
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
                      "Leave Your Feedback",
                      style: const TextStyle(
                        // fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                  //.
                  //.
                  //feedback form
                  Container(
                    margin: EdgeInsets.all(24),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          //.
                          //.
                          //feedback form Field
                          TextFormField(
                            decoration:
                                InputDecoration(labelText: "Your Feedback"),
                            validator: (String? value) {
                              if (value == null || value.trim().length == 0) {
                                return "Feedback is required";
                              }
                              return null;
                            },
                            onSaved: (value) => {_feedback = value},
                            onChanged: (value) {
                              // _feedback = value;
                            },
                          ),
                          const SizedBox(
                            width: double.infinity,
                            height: 20.0,
                          ),
                          // .
                          // .
                          // submit button
                          ElevatedButton.icon(
                            icon: const Icon(
                              Icons.send,
                            ),
                            label: Text("Submit"),
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
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            ),
                            onPressed: () {
                              validator();
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ]))));
  }
}
