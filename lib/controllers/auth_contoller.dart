import 'package:blog/models/userModel.dart';
import 'package:blog/screens/home_screen.dart';
import 'package:blog/screens/signup_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  late Rx<User?> _user;
  static AuthController authController = Get.find(); 
  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    _user = Rx<User?>(FirebaseAuth.instance.currentUser);
    _user.bindStream(FirebaseAuth.instance.authStateChanges());
    ever(_user,_setInitialScreen);

  }
  void _setInitialScreen(User? user){
    if (user == null){
      Get.offAll(()=>SignUpScreen());
    }else{
      Get.offAll(()=>HomeScreen(uid: user.uid,));
    }
  }
  static Future<UserModel> signUp(String email, String password, String username) async{
    try{
    UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
    UserModel user = UserModel(uid: userCredential.user!.uid, email: email, username: username, profileImageURL: '');
    FirebaseFirestore.instance.collection('users').doc(userCredential.user!.uid).set(user.toMap());
    return user;
    }catch(e){
      print(e.toString());
      return UserModel(uid: 'uid', email: email, username: 'username', profileImageURL: 'profileImageURL');
    }
  } 
  static void signIn(String email, String password){
    FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
    Get.snackbar('Sign In', 'all good');
  }
}   