import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:riyapola_app/screens/add_feedback.dart';
import 'package:riyapola_app/services/auth_services.dart';
import 'package:riyapola_app/widgets/buttons/my_ad_view.dart';
import 'screens/user_profile_screen.dart';
import 'screens/seller_profile.dart';
import './screens/splash_screen.dart';
import './screens/connection_failed.dart';
import 'screens/home_screeen.dart';
import 'screens/main_screen.dart';
import './screens/category_screen.dart';
import './screens/login_screen.dart';
import './screens/register_screen.dart';
import './screens/singlechat.dart';
import './screens/post_advertisement.dart';
import './screens/edit_advertisement.dart';
import './screens/welcome_screen.dart';
import './screens/my_advertisements.dart';
import './screens/view_advertisement.dart';
import 'screens/chatList.dart';
import './screens/chatnotifacations.dart';
import './screens/seller_profile.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Color appPrimaryColor = const Color(0xff0094FF);
  Color appPrimaryColorDark = const Color(0xff0077CD);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthService>(
          create: (_) => AuthService(FirebaseAuth.instance),
        ),
        StreamProvider(
          create: (context) => context.read<AuthService>().authStateChanges,
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          //theme color
          primaryColor: appPrimaryColor,
          primaryColorDark: appPrimaryColorDark,

          //font
          fontFamily: 'Averta',
        ),
        debugShowCheckedModeBanner: false,

        //-----main
        home: AuthWrapper(),

        //-----testing
        // home: MyAdvertisements(),
        // home: my_notications(),
        // home: SellerProfile(),
        // home: MainScreen(),

        routes: {
          //data routes
          '/home': (ctx) => MainScreen(),
          // '/home': (ctx) => Home(),
          '/view-add': (ctx) => ViewAdvertisement(),
          '/view-my-add': (ctx) => ViewMyAdvertiseMent(),
          '/edit-add': (ctx) => EditAdvertisement(),
          '/categories': (ctx) => CategoryScreen(),

          //notifications
          '/single-chat-view': (ctx) => ChatScreen(),
          '/my-chats': (ctx) => my_chats(),
          '/my-chat-notifications': (ctx) => my_notications(),

          '/seller-profile': (ctx) => SellerProfile(),
          '/add-feedback-view': (ctx) => AddFeedback(),

          '/user-profile': (ctx) => Profile(),

          //normal routes
          '/post-add': (ctx) => PostAdvertisement(),
          '/my-ads': (ctx) => MyAdvertisements(),

          '/login': (ctx) => Login(),
          '/register': (ctx) => Register(),

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
      ),
    );
  }
}

class AuthWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = context.watch<User?>();

    if (user != null) {
      return MainScreen();
    }
    return SplashScreen();
  }
}
