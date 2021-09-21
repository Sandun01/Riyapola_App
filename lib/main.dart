import 'package:flutter/material.dart';
import './screens/splash_screen.dart';
import './screens/connection_failed.dart';
import 'screens/home_screeen.dart';
import './widgets/bottom_nav_bar.dart';
import './screens/category_screen.dart';
import './screens/login_screen.dart';
import './screens/singlechat.dart';
// import './screens/register_screen.dart';
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
    home: Home(),
    routes: {
      //data routes
      '/home': (ctx) => Home(),
      '/view-add': (ctx) => ViewAdvertisement(),
      '/edit-add': (ctx) => EditAdvertisement(),

      //normal routes
      '/post-add': (ctx) => PostAdvertisement(),
      '/login': (ctx) => Login(),
      // '/register': (ctx) => Login(),

      '/connection-failed': (ctx) => ConnectionFailed(),
    },
    //if rout not found
    onGenerateRoute: (settings) {
      print(settings.arguments);
      return MaterialPageRoute(
        //need to change into the home
        builder: (ctx) => ConnectionFailed(),
      );
    },
    //if faild to build screen
    onUnknownRoute: (settings) {
      print(settings.arguments);
      return MaterialPageRoute(
        //need to change into the error page
        builder: (ctx) => ConnectionFailed(),
      );
    },
  ));
}
