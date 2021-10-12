import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class userImage extends StatefulWidget {
  userImage(this.imagePickFn);
  final void Function(File pickedImage) imagePickFn;
  @override
  _userImageState createState() => _userImageState();
}

class _userImageState extends State<userImage> {
  late File? _pickedImage = null;
  Future<void> _pickImage() async {
    final pickedImagedFile = await await ImagePicker.platform.pickImage(
      source: ImageSource.camera,
      imageQuality: 50,
      maxWidth: 150,
      // maxWidth: 600, //crop image and save size
    );
    setState(() {
      _pickedImage = File(pickedImagedFile!.path);
    });
    widget.imagePickFn(File(pickedImagedFile!.path));
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      CircleAvatar(
        radius: 30,
        backgroundColor: Colors.grey,
        backgroundImage: _pickedImage != null ? FileImage(_pickedImage!) : null,
      ),
      TextButton.icon(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        ),
        onPressed: _pickImage,
        icon: Icon(Icons.image),
        label: Text('Add Image'),
      ),
    ]);
  }
}
