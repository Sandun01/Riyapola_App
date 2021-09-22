import 'package:flutter/material.dart';

import 'home_screeen.dart';
import 'category_screen.dart';
import 'chatList.dart';
import 'user_profile_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // nav bar 1
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    print(index);
  }

  List<Widget> _widgetOptions = <Widget>[
    Home(),
    CategoryScreen(),
    CategoryScreen(), //notications
    my_chats(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(0),
          child: AppBar(
            backgroundColor: Theme.of(context).colorScheme.primary,
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 30.0,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.apps,
                size: 30.0,
              ),
              label: 'Categories',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.notifications,
                size: 30.0,
              ),
              label: 'Notification',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.comment,
                size: 30.0,
              ),
              label: 'Messages',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.account_circle,
                size: 30.0,
              ),
              label: 'Profile',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white54,
          showUnselectedLabels: true,
          backgroundColor: Theme.of(context).colorScheme.primary,
        ),

        //..
        //..
        //Body
        body: _widgetOptions.elementAt(_selectedIndex));
  }
}


// ----
// import 'package:flutter/material.dart';
// import 'package:custom_navigator/custom_navigator.dart';

// import 'home_screeen.dart';
// import 'category_screen.dart';

// class BottomNavBar extends StatefulWidget {
//   const BottomNavBar({Key? key}) : super(key: key);

//   @override
//   _BottomNavBarState createState() => _BottomNavBarState();
// }

// class _BottomNavBarState extends State<BottomNavBar> {
//   final Page _page = Page('Page 0');
//   int _currentIndex = 0;

//   // navigator from outside it's widget tree subtree
//   GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

//   // int _selectedIndex = 0;

//   // void _onItemTapped(int index) {
//   //   setState(() {
//   //     _selectedIndex = index;
//   //   });
//   //   print(index);
//   // }

//   List<Widget> _widgetOptions = <Widget>[
//     Home(),
//     CategoryScreen(),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: PreferredSize(
//         preferredSize: const Size.fromHeight(0),
//         child: AppBar(
//           backgroundColor: Theme.of(context).colorScheme.primary,
//         ),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(
//               Icons.home,
//               size: 30.0,
//             ),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(
//               Icons.apps,
//               size: 30.0,
//             ),
//             label: 'Categories',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(
//               Icons.notifications,
//               size: 30.0,
//             ),
//             label: 'Notification',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(
//               Icons.comment,
//               size: 30.0,
//             ),
//             label: 'Messages',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(
//               Icons.account_circle,
//               size: 30.0,
//             ),
//             label: 'Profile',
//           ),
//         ],
//         // currentIndex: _selectedIndex,
//         // onTap: _onItemTapped,
//         currentIndex: _currentIndex,
//         onTap: (index) {
//           // here we used the navigator key to pop the stack to get back to our
//           // main page
//           navigatorKey.currentState!.maybePop();
//           setState(() => _page = Page('Page $index'));
//           _currentIndex = index;
//         },
//         type: BottomNavigationBarType.fixed,
//         selectedItemColor: Colors.white,
//         unselectedItemColor: Colors.white54,
//         showUnselectedLabels: true,
//         backgroundColor: Theme.of(context).colorScheme.primary,
//       ),

//       //..
//       //..
//       //Body
//       // body: _widgetOptions.elementAt(_selectedIndex));
//       body: CustomNavigator(
//         navigatorKey: navigatorKey,
//         home: _page,
//         //Specify your page route [PageRoutes.materialPageRoute] or [PageRoutes.cupertinoPageRoute]
//         pageRoute: PageRoutes.materialPageRoute,
//       ),
//     );
//   }
// }
