import 'package:flutter/material.dart';

class CategoryButtons extends StatelessWidget {
  const CategoryButtons({Key? key}) : super(key: key);

  void _buttonClick() {
    print("Button clicked");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
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
                const SizedBox(
                  width: double.infinity,
                  height: 20.0,
                ),
                Container(
                  padding: const EdgeInsets.only(
                    left: 20.0,
                    right: 20.0,
                  ),
                  margin: const EdgeInsets.only(
                    top: 10.0,
                    bottom: 10.0,
                  ),
                  height: 60.0,
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    icon: const Icon(
                      // Icons.desktop_mac_rounded,
                      // Icons.emoji_transportation_rounded,
                      // Icons.apartment_rounded,
                      // Icons.school,
                      Icons.business_center,
                      size: 30.0,
                    ),
                    label: const Text('Business & Services'),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateColor.resolveWith(
                          (states) => Theme.of(context).colorScheme.primary),
                      textStyle: MaterialStateProperty.resolveWith(
                        (states) => const TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                      ),
                    ),
                    onPressed: _buttonClick,
                  ),
                ),

                ///---
                Container(
                  padding: const EdgeInsets.only(
                    left: 20.0,
                    right: 20.0,
                  ),
                  margin: const EdgeInsets.only(
                    top: 10.0,
                    bottom: 10.0,
                  ),
                  height: 60.0,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateColor.resolveWith(
                          (states) => Theme.of(context).colorScheme.primary),
                      textStyle: MaterialStateProperty.resolveWith(
                        (states) => const TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                      ),
                    ),
                    onPressed: _buttonClick,
                    child: const Text('Electroics'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
