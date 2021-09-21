import 'package:flutter/material.dart';

import '../widgets/buttons/home_advertisement_button.dart';

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
      //add search bar
      //.
      //.
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        //   title: const Padding(
        //     padding: EdgeInsets.only(
        //       top: 20.0,
        //       left: 10,
        //     ),
        //     child: Text(
        //       "Home",
        //       style: TextStyle(
        //         color: Colors.black,
        //         fontSize: 20,
        //         fontWeight: FontWeight.bold,
        //       ),
        //     ),
        //   ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //Title
            Container(
              width: double.infinity,
              alignment: Alignment.center,
              // color: Colors.amber,
              child: const Text(
                "Vehicles",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                ),
              ),
            ),
            //list view
            Container(
              width: double.infinity,
              alignment: Alignment.center,
              // color: Colors.amber,
              child: Column(
                children: [
                  HomeAdvertisementButton(),
                  HomeAdvertisementButton(),
                  HomeAdvertisementButton(),
                  HomeAdvertisementButton(),
                  HomeAdvertisementButton(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
