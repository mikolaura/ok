import 'dart:io';

import 'package:blog/models/userModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';

class ChangeController extends GetxController {
  void changeData(String uid, String username, File? image, String lastProfilePicURL, String lastUsername, String email) async{
    try{
    var pic = lastProfilePicURL;
    var _username = username.isEmpty ? lastUsername : username;
    if (image !=null){
      Reference ref = FirebaseStorage.instance.ref().child('picture').child(uid);
      UploadTask uploadTask = ref.putFile(image);
      TaskSnapshot snap = await uploadTask;
      String downloadUrl = await snap.ref.getDownloadURL();
      pic = downloadUrl;
    }
    await FirebaseFirestore.instance.collection('users').doc(uid).set(
      UserModel(uid: uid, email: email, username: _username, profileImageURL: pic).toMap()
    );
  }catch(e){
    Get.snackbar('Error', e.toString());
  }
  }
}