import 'package:flutter/material.dart';
import 'package:link_us/services/auth_service.dart';

// UI for registering a new user in the app

class SignUpView extends StatefulWidget {
  @override
  _SignUpViewState createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final formKey = GlobalKey<FormState>();
  String _email, _password, _name;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Sign up works"),
        Form(
          key: formKey,
          child: Column(
            //children: buildInputs(),
          ),
        ),
      ],
    );
  }
/*
  List<Widget> buildInputs() {
    List<Widget> textFields = [];
    // THIS IS THE USERINPUT TEXTFIELD FOR EMAIL
    textFields.add(
      TextFormField(
        style: TextStyle(fontSize: 22.0),
        decoration: buildSignUpInputDecoration("Email"),
        onSaved: (value) => _email = value,
      ),
    );
    // THIS IS THE USERINPUT TEXTFIELD FOR PASSWORD
    textFields.add(SizedBox(
      height: 20.0,
    ));
    textFields.add(TextFormField(
      style: TextStyle(fontSize: 22.0),
      decoration: buildSignUpInputDecoration("Passord"),
      onSaved: (value) => _password = value,
    ));
    textFields.add(SizedBox(
      height: 20.0,
    ));
    textFields.add(TextFormField(
      style: TextStyle(fontSize: 22.0),
      decoration: buildSignUpInputDecoration("Passord"),
      onSaved: (value) => _password = value,
    ));
    textFields.add(SizedBox(
      height: 20.0,
    ));
    textFields.add(TextFormField(
      style: TextStyle(fontSize: 22.0),
      decoration: buildSignUpInputDecoration("Passord"),
      onSaved: (value) => _password = value,
    ));

    return textFields;
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
  }*/
}
// 38 05 https://www.youtube.com/watch?v=iTYD13w6Duo&t=642s
