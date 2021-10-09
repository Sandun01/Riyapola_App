import 'package:flutter/material.dart';

class MyAdsButton extends StatefulWidget {
  final String id, addTitle, description, addImage;
  const MyAdsButton({
    Key? key,
    required this.id,
    required this.addTitle,
    required this.description,
    required this.addImage,
  }) : super(key: key);

  @override
  _MyAdsButtonState createState() => _MyAdsButtonState();
}

class _MyAdsButtonState extends State<MyAdsButton> {
  // String _id = id;
  // String _title = "LAND CRUISER V8";
  // String _description =
  //     "The Land Cruiser’s robust build and durability has tackled on the most challenging desert tracks and mountain ranges. But the Land Cruiser is not just about tough protection, it offers a comfortable, peaceful drive thanks to sound-absorbing and noise-cancelling materials.";

  // String _id = id;
  // String _title = title;
  // String _description = description;

  //on click
  void _hadleClick(BuildContext ctx) {
    print("hadle Click add");
    Navigator.of(ctx).pushNamed(
      '/edit-add',
      arguments: {
        // 'id': _id,
        // 'title': _title,
        // 'description': _description,
      },
    );
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
            onTap: () => _hadleClick(context),
            contentPadding: const EdgeInsets.all(
              20.0,
            ),
            leading: Image.network(widget.addImage),
            title: Text(
              widget.addTitle,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            subtitle: Text(widget.description),
          ),
        ],
      ),
    );
  }
}
