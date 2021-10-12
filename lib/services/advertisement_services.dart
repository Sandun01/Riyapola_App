// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import '../models/advertisement.dart';

// class AdvertisementServices {
//   FirebaseFirestore? _instance;

//   List<Advertisement> _ads = [];

//   List<Advertisement> getAdvertisements() {
//     return _ads;
//   }

//   Future<Map> getAdsFromFirebase() async {
//     _instance = FirebaseFirestore.instance;

//     CollectionReference ads = _instance!.collection('ads');

//     DocumentSnapshot snapshot = await ads.doc().get();

//     var data = snapshot.data() as Map;

//     return data;
//   }
// }
