import 'package:blog/controllers/auth_contoller.dart';
import 'package:blog/models/userModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _usernameController = TextEditingController();
  void signUp() async{
    UserModel user = await AuthController.signUp(_emailController.text, _passwordController.text, _usernameController.text);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(38.0),
        child: Center(child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: Container(),flex: 1,),
            Text('Sign up screen', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
            const SizedBox(height: 30,),
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                hintText: 'Username',
                filled: true,
                fillColor: Color.fromARGB(176, 158, 158, 158)
              ),

            ),
            const SizedBox(height: 10,),
            // text field email
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                hintText: 'Email',
                filled: true,
                fillColor: Color.fromARGB(176, 158, 158, 158)
              ),

            ),
            const SizedBox(height: 10,),
            // text field password
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                hintText: 'Password',
                filled: true,
                fillColor: Color.fromARGB(176, 158, 158, 158)
              ),
              obscureText: true,
            ),
            ElevatedButton(onPressed: (){
              signUp();
            }, child: Text('Sign up')),
            Expanded(child: Container(),flex: 1,),
            Row(children: [
              Text('Already have an account? '),
              TextButton(onPressed: (){}, child: Text('Log In'),)
            ],)
          ],
        )),
      ),
    );
  }
}
