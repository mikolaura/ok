import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import 'package:blog/models/userModel.dart';

class MainController extends GetxController {
  // MainController mainController = Get.find();
  final Rx<UserModel> _user = Rx<UserModel>(UserModel(uid: 'uid', email: 'email', username: 'username', profileImageURL: 'profileImageURL'));
  UserModel get user => _user.value;
  getUserData(String uid)async{
    // FirebaseAuth.instance.currentUser!.uid;
    DocumentSnapshot userDoc = await FirebaseFirestore.instance.collection('users').doc(uid).get();
    _user.value = UserModel.fromMap(userDoc.data() as Map<String, dynamic>);
    print(user.username);   
  }
}
