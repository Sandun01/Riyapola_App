import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class userImage extends StatefulWidget {
  const userImage({Key? key}) : super(key: key);

  @override
  _userImageState createState() => _userImageState();
}

class _userImageState extends State<userImage> {
  void _pickImage() {
    final ImagePicker _picker = ImagePicker();
    // final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      CircleAvatar(
        radius: 30,
      ),
      TextButton.icon(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        ),
        onPressed: () {},
        icon: Icon(Icons.image),
        label: Text('Add Image'),
      ),
    ]);
  }
}
