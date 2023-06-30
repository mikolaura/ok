import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:blog/controllers/main_controller.dart';
import 'package:blog/screens/add_page.dart';
import 'package:blog/screens/home_page.dart';
import 'package:blog/screens/profile_page.dart';
class HomeScreen extends StatefulWidget {
  String uid = '';
   HomeScreen({
    Key? key,
    required this.uid,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final MainController mainController = Get.put(MainController());
  var page = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mainController.getUserData(widget.uid);
    page = [
    HomePage(),
    AddPage(),
    ProfilePage(mainController: mainController,)
  ];
  }
  int indexPage = 0;
  
  Widget build(BuildContext context) {

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            indexPage = index;
          });
        },
        currentIndex: indexPage,
        selectedItemColor:Colors.lime,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Add Post'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
      body: page[indexPage]
    );
  }
}