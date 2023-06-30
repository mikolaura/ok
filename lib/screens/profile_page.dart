import 'package:blog/controllers/main_controller.dart';
import 'package:flutter/material.dart';
class ProfilePage extends StatelessWidget {
  late MainController mainController;
  ProfilePage({
    Key? key,
    required this.mainController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(mainController.user.username));
  }
}
