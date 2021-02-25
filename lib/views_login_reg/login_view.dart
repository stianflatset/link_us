import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:link_us/services/auth_service.dart';
// UI for user login

class LoginView extends StatelessWidget {

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: emailController,
          decoration: buildSignUpInputDecoration("Email"),
          ),
        SizedBox(height: 20.0,),
        TextField(
          controller: passwordController,
          decoration: buildSignUpInputDecoration("Password"),
        ),
        RaisedButton(
            onPressed: () {
              // Code for signing in
            }
        ),
      ],
    );
  }

  // THIS IS THE STYLING USED ON THE INPUTFIELDS
  InputDecoration buildSignUpInputDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      filled: true,
      fillColor: Colors.white,
      focusColor: Colors.white,
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black, width: 0.0)),
      contentPadding:
      const EdgeInsets.only(left: 14.0, bottom: 10.0, top: 10.0),
    );
  }
}
