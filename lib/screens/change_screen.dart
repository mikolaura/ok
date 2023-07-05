import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'package:blog/controllers/change_contoller.dart';
import 'package:blog/models/userModel.dart';

class ChangeScreen extends StatefulWidget {
  UserModel user;
   ChangeScreen({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  State<ChangeScreen> createState() => _ChangeScreenState();
}

class _ChangeScreenState extends State<ChangeScreen> {
  ChangeController changeController = Get.put(ChangeController());
  TextEditingController _usernameController = TextEditingController();
  late File? image;
  void getImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image_ = await picker.pickImage(source: ImageSource.gallery);
    image = File(image_!.path);
    print(image_!.path);
  }
  void change() async{
    changeController.changeData(widget.user.uid, _usernameController.text, image, widget.user.profileImageURL, widget.user.username,widget.user.email);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: 
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
                IconButton(
                    onPressed: getImage,
                    icon: Icon(
                      Icons.person,
                      size: 50,
                    )),
                TextField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                      hintText: 'Username',
                      filled: true,
                      fillColor: Color.fromARGB(176, 158, 158, 158)),
                ),
                Stack(children: [
                  Container(
                    margin: const EdgeInsets.only(left: 10),
                    width: 38 * 3,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(200, 255, 193, 7)
                        ,
                                                borderRadius: BorderRadius.only(topLeft: Radius.circular(10),bottomLeft: Radius.circular(10))
),
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 10),
                    width: 38 * 3,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(243, 255, 193, 7),
                        borderRadius: BorderRadius.only(topRight: Radius.circular(10),bottomRight: Radius.circular(10))
                        ),
                  ),
                  IconButton(onPressed: change, icon: Icon(Icons.add))
                ])
              ]),
          
          
        ),
      ),
    );
  }
}
