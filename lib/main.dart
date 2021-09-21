import 'package:flutter/material.dart';
import './screens/splash_screen.dart';
import './screens/connection_failed.dart';
import 'screens/home_screeen.dart';
import './widgets/bottom_nav_bar.dart';
import './screens/category_screen.dart';
import './screens/login_screen.dart';
import './screens/post_advertisement.dart';
import './screens/edit_advertisement.dart';
import './screens/welcome_screen.dart';
import './screens/my_advertisements.dart';
import './screens/view_advertisement.dart';

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
    home: ViewAdvertisement(),
  ));
}
