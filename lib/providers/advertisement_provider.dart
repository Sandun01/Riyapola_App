import 'package:flutter/material.dart';

import '../models/advertisement.dart';

class Advertisement with ChangeNotifier {
  List<Advertisement> _ads = [];

  List<Advertisement> get advertisements {
    return [..._ads];
  }

  void postAdvertisement() {
    // _ads.add(value);
    notifyListeners();
  }
}
