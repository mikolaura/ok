import 'package:blog/controllers/auth_contoller.dart';
import 'package:flutter/material.dart';

import '../models/userModel.dart';
class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _usernameController = TextEditingController();
  void signUp() async{
  AuthController.signIn(_emailController.text, _passwordController.text);
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
            // const SizedBox(height: 10,),
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
            }, child: Text('Log in')),
            Expanded(child: Container(),flex: 1,),
            Row(children: [
              Text('Not have an account? '),
              TextButton(onPressed: (){}, child: Text('Sign up'),)
            ],)
          ],
        )),
      ),
    );
      }
}