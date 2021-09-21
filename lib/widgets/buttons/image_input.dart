import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class ImageInput extends StatefulWidget {
  const ImageInput({Key? key}) : super(key: key);

  @override
  _ImageInputState createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  late File? _storedImage = null;

  Future<void> _takePicture() async {
    final imageFile = await ImagePicker.platform.pickImage(
      source: ImageSource.gallery,
      maxWidth: 600, //crop image and save size
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 150,
          padding: const EdgeInsets.only(
            top: 10,
            bottom: 10,
          ),
          decoration: BoxDecoration(
            color: Colors.white30,
            border: Border.all(
              width: 1,
              color: Colors.white54,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(
                20.0,
              ),
            ),
          ),
          child: _storedImage != null
              ? Image.file(
                  _storedImage!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                )
              : const Image(
                  image: AssetImage(
                    'assets/icons/image_icon.png',
                  ),
                  height: 300,
                  width: 300,
                ),
          alignment: Alignment.center,
        ),
        Container(
          width: double.infinity,
          child: OutlinedButton(
            child: const Text(
              "Upload Image",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            style: ButtonStyle(
              backgroundColor: MaterialStateColor.resolveWith(
                (states) => Colors.white30,
              ),
            ),
            onPressed: _takePicture,
            // ),
          ),
          alignment: Alignment.center,
        ),
      ],
    );
  }
}
