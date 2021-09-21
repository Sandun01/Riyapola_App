import 'package:flutter/material.dart';
import 'screens/user_profile_screen.dart';
import 'screens/seller_profile.dart';
import './screens/splash_screen.dart';
import './screens/connection_failed.dart';
import './screens/all_ads_screeen.dart';
import './widgets/bottom_nav_bar.dart';
import 'screens/category_screen.dart';
import './screens/login_screen.dart';

void main() {
  Color appPrimaryColor = const Color(0xff0094FF);
  Color appPrimaryColorDark = const Color(0xff0077CD);

  runApp(MaterialApp(
    theme: ThemeData(
      //theme color
      primaryColor: appPrimaryColor,
      primaryColorDark: appPrimaryColorDark,

      //font
      fontFamily: 'Averta',
    ),
    debugShowCheckedModeBanner: false,
    home: SellerProfile(),
  ));
}
