import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../widgets/buttons/home_advertisement_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Padding(
          padding: EdgeInsets.only(
            top: 20.0,
            left: 10,
          ),
          child: Text(
            "Home",
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //Title
            // Container(
            //   width: double.infinity,
            //   alignment: Alignment.center,
            //   // color: Colors.amber,
            //   child: const Text(
            //     "Vehicles",
            //     style: TextStyle(
            //       color: Colors.black,
            //       fontSize: 30,
            //     ),
            //   ),
            // ),
            //list view
            Container(
              width: double.infinity,
              alignment: Alignment.center,
              child: Container(
                width: double.infinity,
                alignment: Alignment.center,
                // color: Colors.amber,
                child: StreamBuilder(
                  stream:
                      FirebaseFirestore.instance.collection('ads').snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                          snapshot) {
                    if (!snapshot.hasData) {
                      return Text('Loading data ... Please Wait ...');
                    }
                    if (snapshot.hasError) {
                      return Text('Something went wrong');
                    }
                    return Column(
                      children:
                          snapshot.data!.docs.map((DocumentSnapshot document) {
                        Map<String, dynamic> data =
                            document.data()! as Map<String, dynamic>;
                        // print(document.reference.id);
                        return HomeAdvertisementButton(
                          id: document.reference.id,
                          addTitle: data['title'],
                          location: data['location'],
                          addImage: data['imageUrl'],
                          price: data['price'].toString(),
                        );
                      }).toList(),
                    );
                  },
                ),
              ),
              // color: Colors.amber,

              // child: Column(
              // children: [
              //   HomeAdvertisementButton(),
              //   HomeAdvertisementButton(),
              //   HomeAdvertisementButton(),
              //   HomeAdvertisementButton(),
              //   HomeAdvertisementButton(),
              // ],
              // ),
            ),
          ],
        ),
      ),
    );
  }
}
