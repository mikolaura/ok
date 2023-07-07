import 'dart:io';
import 'dart:async';
import 'package:blog/controllers/main_controller.dart';
import 'package:blog/screens/change_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePage extends StatefulWidget {
  late MainController mainController;
  ProfilePage({
    Key? key,
    required this.mainController,
  }) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.mainController.user.username),
        actions: [
          IconButton(
              onPressed: () {
                Get.to(ChangeScreen(
                  user: widget.mainController.user,
                ));
              },
              icon: Icon(Icons.change_circle))
        ],
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.network(widget.mainController.user.profileImageURL.isEmpty
                  ? "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR5WiuJQWamgq2iVSz7Af-UgVlj3j7fskOC0tUXraUs&s"
                  : widget.mainController.user.profileImageURL,
                  width: 250,
                  height: 300,),
              Text(
                widget.mainController.user.username,
                style: TextStyle(
                  fontSize: 29,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
