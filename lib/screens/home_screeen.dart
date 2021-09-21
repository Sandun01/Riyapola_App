import 'package:flutter/material.dart';

import '../widgets/bottom_nav_bar.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void _onClickViewAdd() {
    print("View add");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Padding(
          padding: EdgeInsets.only(
            top: 20.0,
            left: 10,
          ),
          child: Text(
            "My Advertisements",
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //post add button
            Container(
              width: double.infinity,
              alignment: Alignment.center,
              margin: const EdgeInsets.only(
                top: 10.0,
                bottom: 10.0,
              ),
              child: ElevatedButton.icon(
                icon: const Icon(
                  Icons.add_circle,
                ),
                label: const Text("Post New Advertisement"),
                style: ButtonStyle(
                  backgroundColor: MaterialStateColor.resolveWith(
                      (states) => Theme.of(context).colorScheme.primary),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ),
                onPressed: _onClickViewAdd,
              ),
            ),

            //list view
            Container(
              width: double.infinity,
              alignment: Alignment.center,
              // color: Colors.amber,
              child: Column(
                children: [
                  // view_advertisement_Button(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
