import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:link_us/services/auth_service.dart';
import 'package:link_us/services/palette.dart';
import 'package:provider/provider.dart';
// UI for user login

class LoginView extends StatelessWidget {

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.only(top:_height*0.03),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: _height*0.03),
            // Textfield for the email
            child: TextField(
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
          ),
          // Textfield for the password
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
          Padding(
            padding: EdgeInsets.only(top: _height*0.02),
            child: TextButton(
              onPressed: () {
                context.read<AuthService>().signIn(
                    email: emailController.text,
                    password: passwordController.text,
                );
              },
              style: TextButton.styleFrom(
                minimumSize: Size(180, 40),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                primary: Colors.white,
                backgroundColor: Palette.buttonColor,
              ),
              child: Text("LOGG INN"),
            ),
          ),
          // "Eller Logg inn med"
            Padding(
              padding: EdgeInsets.only(top: _height*0.03, bottom: _height*0.02),
              child: Row(
                children: <Widget>[
                  Expanded(child: new Container(
                    margin: const EdgeInsets.only(left: 10.0, right: 20.0),
                    child: Divider(
                      color: Colors.black,
                    ),
                  ),
                  ),
                  Text("Eller", style: TextStyle(color: Colors.black, fontSize: 16.0),),
                  Expanded(child: new Container(
                    margin: const EdgeInsets.only(left: 20.0, right: 10.0),
                    child: Divider(
                      color: Colors.black,
                    ),
                  ))
                ],
              ),
            ),
          Text("Logg inn med sosiale medier", style: TextStyle(fontSize: 14.0, color: Palette.activeColor, fontWeight: FontWeight.bold),),
          // Buttons for logging in with google or linkedIn
          Column(
            children: [
              Padding(padding: EdgeInsets.only(bottom: _height*0.02)),
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
                ),
                icon: Icon(CommunityMaterialIcons.linkedin),
                label: Text("Sign in with LinkedIn", style: TextStyle(fontSize: 18.0),),
              ),
              Padding(padding: EdgeInsets.only(bottom:_height*0.02)),
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
                ),
                icon: Icon(CommunityMaterialIcons.google),
                label: Text("Sign in with Google", style: TextStyle(fontSize: 18.0),),
              ),
            ],
          ),

        ],
      ),
    );
  }
}

