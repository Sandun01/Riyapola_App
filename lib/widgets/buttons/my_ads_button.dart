import 'package:flutter/material.dart';

class MyAdsButton extends StatefulWidget {
  const MyAdsButton({Key? key}) : super(key: key);

  @override
  _MyAdsButtonState createState() => _MyAdsButtonState();
}

class _MyAdsButtonState extends State<MyAdsButton> {
  String _title = "LAND CRUISER V8";
  String _description =
      "The Land Cruiser’s robust build and durability has tackled on the most challenging desert tracks and mountain ranges. But the Land Cruiser is not just about tough protection, it offers a comfortable, peaceful drive thanks to sound-absorbing and noise-cancelling materials.";

  //on click
  void _hadleClick() {
    print("hadle Click add");
  }

  //build
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      margin: const EdgeInsets.only(
        right: 20.0,
        left: 20.0,
        top: 10.0,
        bottom: 10.0,
      ),
      elevation: 5,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            onTap: _hadleClick,
            contentPadding: const EdgeInsets.all(
              20.0,
            ),
            leading: const Image(
              image: AssetImage(
                'assets/images/sample_vehicle.jpg',
              ),
            ),
            title: Text(
              _title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                // fontFamily: "AguafinaScript",
              ),
            ),
            subtitle: Text(
              _description.substring(0, 90) + "...",
            ),
          ),
        ],
      ),
    );
  }
}
