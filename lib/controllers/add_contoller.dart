import 'dart:io';
import 'dart:math';

import 'package:blog/models/articleModel.dart';
import 'package:blog/models/userModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';

class AddController extends GetxController {
  Future<String> _uploadImageToStorage(File image, int id) async{
    
    Reference ref = FirebaseStorage.instance.ref().child('imagesForArticle').child(id.toString());
    UploadTask uploadTask = ref.putFile(image);
    TaskSnapshot snap = await uploadTask;
    return await snap.ref.getDownloadURL();
  }
  addArticle(String title, String anons, String text, File image) async {
    try {
      //generate id
      int id = Random().nextInt(547897);
      //get user data
      String uid = FirebaseAuth.instance.currentUser!.uid;
      DocumentSnapshot userDoc = await FirebaseFirestore.instance.collection('users').doc(uid).get();
      UserModel user = UserModel.fromMap(userDoc.data()! as Map<String,dynamic>);
      //save image
      String imageUrl = await _uploadImageToStorage(image, id);
      // create and save article
      Map<String,dynamic> article = ArticleModel(uid: uid, username: user.username, profilePicture: user.profileImageURL, title: title, text: text, anons: anons, imageURL: imageUrl).toMap();
      FirebaseFirestore.instance.collection('article').doc(id.toString()).set(article);
      // Send snackbar if everything goes without problem
      Get.snackbar('All good', 'Please restart app to see your article in home page');
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }
}
