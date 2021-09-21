import 'package:flutter/material.dart';
import '../widgets//buttons/my_ads_button.dart';

class MyAdvertisements extends StatefulWidget {
  const MyAdvertisements({Key? key}) : super(key: key);

  @override
  _MyAdvertisementsState createState() => _MyAdvertisementsState();
}

class _MyAdvertisementsState extends State<MyAdvertisements> {
  void _onClickPostNewAddButton() {
    print("post new add");
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
                onPressed: _onClickPostNewAddButton,
              ),
            ),

            //list view
            Container(
              width: double.infinity,
              alignment: Alignment.center,
              // color: Colors.amber,
              child: Column(
                children: [
                  MyAdsButton(),
                  MyAdsButton(),
                  MyAdsButton(),
                  MyAdsButton(),
                  MyAdsButton(),
                  MyAdsButton(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
