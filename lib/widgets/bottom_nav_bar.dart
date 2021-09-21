import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  // nav bar 1
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    print(index);
  }

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
    );
  }

  //nav bar 2

  // final _selectedItemColor = Colors.white;
  // final _unselectedItemColor = Colors.white54;
  // final _selectedBgColor = const Color(0xff0077CD);
  // final _unselectedBgColor = const Color(0xff0094FF);
  // int _selectedIndex = 0;

  // void _onItemTapped(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });
  // }

  // Color _getBgColor(int index) =>
  //     _selectedIndex == index ? _selectedBgColor : _unselectedBgColor;

  // Color _getItemColor(int index) =>
  //     _selectedIndex == index ? _selectedItemColor : _unselectedItemColor;

  // Widget _buildIcon(IconData iconData, String text, int index) => Container(
  //       width: double.infinity,
  //       height: kBottomNavigationBarHeight,
  //       child: Material(
  //         color: _getBgColor(index),
  //         child: InkWell(
  //           child: Column(
  //             mainAxisAlignment: MainAxisAlignment.center,
  //             children: <Widget>[
  //               Icon(iconData),
  //               Text(text,
  //                   style: TextStyle(
  //                     color: _getItemColor(index),
  //                     fontSize: 12,
  //                   )),
  //             ],
  //           ),
  //           onTap: () => _onItemTapped(index),
  //         ),
  //       ),
  //     );

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     bottomNavigationBar: BottomNavigationBar(
  //       selectedFontSize: 0,
  //       items: <BottomNavigationBarItem>[
  //         BottomNavigationBarItem(
  //           icon: _buildIcon(Icons.home, 'Home', 0),
  //           title: SizedBox.shrink(),
  //         ),
  //         BottomNavigationBarItem(
  //           icon: _buildIcon(Icons.apps, 'Categories', 1),
  //           title: SizedBox.shrink(),
  //         ),
  //         BottomNavigationBarItem(
  //           icon: _buildIcon(Icons.notifications, 'Notification', 2),
  //           title: SizedBox.shrink(),
  //         ),
  //         BottomNavigationBarItem(
  //           icon: _buildIcon(Icons.comment, 'Messages', 3),
  //           title: SizedBox.shrink(),
  //         ),
  //         BottomNavigationBarItem(
  //           icon: _buildIcon(Icons.account_circle, 'Profile', 4),
  //           title: SizedBox.shrink(),
  //         ),
  //       ],
  //       currentIndex: _selectedIndex,
  //       selectedItemColor: _selectedItemColor,
  //       unselectedItemColor: _unselectedItemColor,
  //     ),
  //   );
  // }

  //

}
