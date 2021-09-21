import 'package:flutter/material.dart';
import '../widgets/buttons/category_button.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  final buttonData = const [
    {
      'category': 'Electronics',
      'icon': Icons.desktop_mac_rounded,
    },
    {
      'category': 'Vehicles',
      'icon': Icons.emoji_transportation_rounded,
    },
    {
      'category': 'Properties',
      'icon': Icons.apartment_rounded,
    },
    {
      'category': 'Education',
      'icon': Icons.school,
    },
    {
      'category': 'Business & Services',
      'icon': Icons.business_center,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
          padding: const EdgeInsets.only(
            top: 20,
          ),
          child: Center(
            child: Card(
              margin: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.only(
                      top: 20.00,
                    ),
                  ),
                  const Text(
                    'Categories',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Averta',
                        fontSize: 40.0,
                        textBaseline: TextBaseline.ideographic),
                  ),

                  //buttons
                  ...buttonData.map(
                    (data) {
                      var name;
                      var icon;

                      data.forEach((key, value) {
                        if (key == 'icon') {
                          icon = value;
                        } else {
                          name = value;
                        }
                      });
                      // print(data);
                      return CategoryButton(name, icon);
                    },
                  ).toList(),

                  //spacing
                  const SizedBox(
                    width: double.infinity,
                    height: 20.0,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
