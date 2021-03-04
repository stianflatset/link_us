import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:link_us/services/auth_service.dart';
import 'package:link_us/services/palette.dart';
import 'package:provider/provider.dart';
// UI for user login

class LoginView extends StatefulWidget {

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // Epost - password - login button widgets
        Expanded(
          flex: 3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Inputfield for email
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email, color: Palette.textColor1,),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Palette.textColor1),
                      borderRadius: BorderRadius.all(Radius.circular(8.0))
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Palette.activeColor, width: 1.5),
                      borderRadius: BorderRadius.all(Radius.circular(8.0))
                  ),
                  contentPadding: EdgeInsets.all(10),
                  hintText: "E-Post Adresse",
                  hintStyle: TextStyle(fontSize: 14, color: Palette.textColor1),
                ),
              ),
              // Inputfield for password
              TextField(
                controller: passwordController,
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
              // Button for logging in
              TextButton(
                onPressed: () {
                  context.read<AuthService>().signIn(
                    email: emailController.text,
                    password: passwordController.text,
                  );
                },
                style: TextButton.styleFrom(
                  minimumSize: Size(220,40),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)
                  ),
                  primary: Colors.white,
                  backgroundColor: Palette.buttonColor,
                  elevation: 5,
                ),
                child: Text("LOGG INN", style: TextStyle(fontSize: 18),),
              ),
              // Forgot password
              Text("Glemt Passord?", style: TextStyle(color: Colors.blueAccent, decoration: TextDecoration.underline),)
            ],
          ),
        ),
        // Dividing the screen with a divider to show Social Media Logins
        Expanded(
          flex: 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Divider(
                color: Palette.textColor2,
              ),
              Text("Logg inn med sosiale medier", style: TextStyle(fontSize: 16.0, color: Palette.activeColor, fontWeight: FontWeight.bold),),
              // Button for linkedin
              TextButton.icon(
                onPressed: () {
                },
                style: TextButton.styleFrom(
                  minimumSize: Size(220,40),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)
                  ),
                  primary: Colors.white,
                  backgroundColor: Color.fromRGBO(40, 103, 178, 1),
                  elevation: 3,
                ),
                icon: Icon(CommunityMaterialIcons.linkedin),
                label: Text("Sign in with LinkedIn", style: TextStyle(fontSize: 18.0),),
              ),
              // Button for google
              TextButton.icon(
                onPressed: () {

                },
                style: TextButton.styleFrom(
                  minimumSize: Size(220,40),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)
                  ),
                  primary: Colors.white,
                  backgroundColor: Color.fromRGBO(66, 133, 244, 1),
                  elevation: 3,
                ),
                icon: Icon(CommunityMaterialIcons.google),
                label: Text("Sign in with Google", style: TextStyle(fontSize: 18.0),),
              ),
            ],
          ),
        )



      ],
    );
  }
}