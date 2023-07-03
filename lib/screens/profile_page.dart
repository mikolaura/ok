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
    return Scaffold(
      appBar: AppBar(
        title: Text( mainController.user.username),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.network(mainController.user.profileImageURL),
          Text(mainController.user.username),
       ],
      ),
    );
  }
}
