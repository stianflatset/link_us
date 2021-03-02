import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:link_us/services/auth_service.dart';
import 'package:link_us/services/palette.dart';
import 'package:provider/provider.dart';

// UI for registering a new user in the app

class SignUpView extends StatelessWidget {

  final TextEditingController fornavnController = TextEditingController();
  final TextEditingController etternavnController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController1 = TextEditingController();
  final TextEditingController passwordController2 = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Inputfield for Fornavn
              TextField(
                controller: fornavnController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person, color: Palette.textColor1,),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Palette.textColor1),
                      borderRadius: BorderRadius.all(Radius.circular(8.0))
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Palette.activeColor, width: 1.5),
                      borderRadius: BorderRadius.all(Radius.circular(8.0))
                  ),
                  contentPadding: EdgeInsets.all(10),
                  hintText: "Fornavn",
                  hintStyle: TextStyle(fontSize: 14, color: Palette.textColor1),
                ),
              ),
              //Inputfield for Etternavn
              TextField(
                controller: etternavnController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person, color: Palette.textColor1,),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Palette.textColor1),
                      borderRadius: BorderRadius.all(Radius.circular(8.0))
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Palette.activeColor, width: 1.5),
                      borderRadius: BorderRadius.all(Radius.circular(8.0))
                  ),
                  contentPadding: EdgeInsets.all(10),
                  hintText: "Etternavn",
                  hintStyle: TextStyle(fontSize: 14, color: Palette.textColor1),
                ),
              ),
              // Inputfield for email
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.mail, color: Palette.textColor1,),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Palette.textColor1),
                      borderRadius: BorderRadius.all(Radius.circular(8.0))
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Palette.activeColor, width: 1.5),
                      borderRadius: BorderRadius.all(Radius.circular(8.0))
                  ),
                  contentPadding: EdgeInsets.all(10),
                  hintText: "E-post Adresse",
                  hintStyle: TextStyle(fontSize: 14, color: Palette.textColor1),
                ),
              ),
              // Inputfield for password
              TextField(
                controller: passwordController1,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock, color: Palette.textColor1,),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Palette.textColor1),
                      borderRadius: BorderRadius.all(Radius.circular(8.0))
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Palette.activeColor, width: 1.5),
                      borderRadius: BorderRadius.all(Radius.circular(8.0))
                  ),
                  contentPadding: EdgeInsets.all(10),
                  hintText: "Passord",
                  hintStyle: TextStyle(fontSize: 14, color: Palette.textColor1),
                ),
              ),
              //Inputfield for repeating passord
              TextField(
                controller: passwordController2,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock, color: Palette.textColor1,),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Palette.textColor1),
                      borderRadius: BorderRadius.all(Radius.circular(8.0))
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Palette.activeColor, width: 1.5),
                      borderRadius: BorderRadius.all(Radius.circular(8.0))
                  ),
                  contentPadding: EdgeInsets.all(10),
                  hintText: "Gjenta Passord",
                  hintStyle: TextStyle(fontSize: 14, color: Palette.textColor1),
                ),
              ),
              // Agree to our terms & conditions
              Container(
                width: 250,
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: "Ved Registrering aksepterer du våre ",
                    style: TextStyle(color: Palette.textColor1),
                    children: [
                      TextSpan(
                        text: "vilkår & betingelser",
                        style: TextStyle(color: Palette.yellowColor),
                      ),
                    ]
                  ),
                ),
              ),
              // Button for Registrer
              TextButton(
                onPressed: () {
                  context.read<AuthService>().signUp(
                    email: emailController.text,
                    password: passwordController1.text,
                  );
                },
                style: TextButton.styleFrom(
                  minimumSize: Size(330,40),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)
                  ),
                  primary: Colors.white,
                  backgroundColor: Palette.buttonColor,
                  elevation: 3,
                ),
                child: Text("Registrer", style: TextStyle(fontSize: 18),),
              ),
            ],
          ),
        )
      ],

    );
  }
}
