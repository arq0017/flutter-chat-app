import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UserImagePicker extends StatefulWidget {

  @override
  _UserImagePickerState createState() => _UserImagePickerState();
}

class _UserImagePickerState extends State<UserImagePicker> {
  var pickedImageFile;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(
      source: ImageSource.gallery,
      imageQuality: 50,
      maxWidth: 150 , 
      maxHeight: 150 , 
    );

    setState(() {
      pickedImageFile = File(pickedFile!.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      //! Profile Picture
      CircleAvatar(
        radius: 40,
        backgroundColor: Colors.grey[900],
        backgroundImage:
            pickedImageFile != null ? FileImage(pickedImageFile) : null,
      ),
      TextButton.icon(
        onPressed: getImage,
        icon: Icon(Icons.add_a_photo),
        label: Text('Add image'),
      ),
    ]);
  }
}
