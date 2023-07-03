import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ChangeScreen extends StatefulWidget {
  const ChangeScreen({super.key});

  @override
  State<ChangeScreen> createState() => _ChangeScreenState();
}

class _ChangeScreenState extends State<ChangeScreen> {
  late File image;
  void getImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image_ = await picker.pickImage(source: ImageSource.gallery);
    image = File(image_!.path);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
              IconButton(onPressed: getImage, icon: Icon(Icons.person, size: 50,)),
            ]),
          ],
        ),
      ),
    );
  }
}
