import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:link_us/services/auth_service.dart';
import 'package:link_us/services/palette.dart';
import 'package:provider/provider.dart';

// UI for registering a new user in the app

class SignUpView extends StatefulWidget {
  @override
  _SignUpViewState createState() => _SignUpViewState();
}

final TextEditingController fornavnController = TextEditingController();
final TextEditingController etternavnController = TextEditingController();
final TextEditingController emailController = TextEditingController();
final TextEditingController passwordController1 = TextEditingController();
final TextEditingController passwordController2 = TextEditingController();
bool _validFornavn = false;
bool _validEtternavn = false;
bool _validEmail = false;
bool _validPassword = false;
bool _validPassword2 = false;


class _SignUpViewState extends State<SignUpView> {

  @override
  Widget build(BuildContext context) {
    return GestureDetector( onTap: (){FocusScope.of(context).unfocus();},
      child: CupertinoScrollbar(
          child: ListView(
            //padding: EdgeInsets.only(left:10.0, right: 10.0),
            children: [
              Padding(padding: EdgeInsets.only(top: 15.0),),
              // Inputfield for Fornavn
              Container(
                child: TextField(
                  controller: fornavnController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.person,
                      color: Palette.textColor1,
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Palette.textColor1),
                        borderRadius: BorderRadius.all(Radius.circular(8.0))),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Palette.activeColor, width: 1.5),
                        borderRadius: BorderRadius.all(Radius.circular(8.0))),
                    contentPadding: EdgeInsets.all(10),
                    hintText: "Fornavn",
                    hintStyle: TextStyle(fontSize: 14, color: Palette.textColor1),
                    errorText: _validFornavn ? 'Skriv inn fornavn' : null,
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 5.0),),
              //Inputfield for Etternavn
              Container(
                width: MediaQuery.of(context).size.width*0.75,
                child: TextField(
                  controller: etternavnController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.person,
                      color: Palette.textColor1,
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Palette.textColor1),
                        borderRadius: BorderRadius.all(Radius.circular(8.0))),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Palette.activeColor, width: 1.5),
                        borderRadius: BorderRadius.all(Radius.circular(8.0))),
                    contentPadding: EdgeInsets.all(10),
                    hintText: "Etternavn",
                    hintStyle: TextStyle(fontSize: 14, color: Palette.textColor1),
                    errorText: _validEtternavn ? 'Skriv inn etternavn' : null,
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 5.0),),
              // Inputfield for email
              Container(
                width: MediaQuery.of(context).size.width*0.75,
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.mail,
                      color: Palette.textColor1,
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Palette.textColor1),
                        borderRadius: BorderRadius.all(Radius.circular(8.0))),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Palette.activeColor, width: 1.5),
                        borderRadius: BorderRadius.all(Radius.circular(8.0))),
                    contentPadding: EdgeInsets.all(10),
                    hintText: "E-post Adresse",
                    hintStyle: TextStyle(fontSize: 14, color: Palette.textColor1),
                    errorText: _validEmail ? 'Skriv inn Epost-Adresse' : null,
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 5.0),),
              // Inputfield for password
              Container(
                width: MediaQuery.of(context).size.width*0.75,
                child: TextField(
                  obscureText: true,
                  controller: passwordController1,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.lock,
                      color: Palette.textColor1,
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Palette.textColor1),
                        borderRadius: BorderRadius.all(Radius.circular(8.0))),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Palette.activeColor, width: 1.5),
                        borderRadius: BorderRadius.all(Radius.circular(8.0))),
                    contentPadding: EdgeInsets.all(10),
                    hintText: "Passord",
                    hintStyle: TextStyle(fontSize: 14, color: Palette.textColor1),
                    errorText: _validPassword ? 'Skriv inn passord' : null,
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 5.0),),
              //Inputfield for confirming passord
              Container(
                width: MediaQuery.of(context).size.width*0.75,
                child: TextField(
                  obscureText: true,
                  controller: passwordController2,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.lock,
                      color: Palette.textColor1,
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Palette.textColor1),
                        borderRadius: BorderRadius.all(Radius.circular(8.0))),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Palette.activeColor, width: 1.5),
                        borderRadius: BorderRadius.all(Radius.circular(8.0))),
                    contentPadding: EdgeInsets.all(10),
                    hintText: "Bekreft Passord",
                    hintStyle: TextStyle(fontSize: 14, color: Palette.textColor1),
                    errorText: _validPassword2 ? 'Skriv inn passord' : null,
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 15.0),),
              // Agree to our terms & conditions
              Padding(
                padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                child: Container(
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
                        ]),
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 15.0),),
              // Button for Registrer
              TextButton(
                onPressed: () async {
                  setState(() {
                    fornavnController.text.isEmpty ? _validFornavn = true : _validFornavn = false;
                    etternavnController.text.isEmpty ? _validEtternavn = true : _validEtternavn = false;
                    emailController.text.isEmpty ? _validEmail = true : _validEmail = false;
                    passwordController1.text.isEmpty ? _validPassword = true : _validPassword = false;
                    passwordController2.text.isEmpty ? _validPassword2 = true : _validPassword2 = false;
                  });

                  if (passwordController1.text == passwordController2.text) {
                    context.read<AuthService>().signUp(
                      email: emailController.text,
                      etternavn: etternavnController.text,
                      fornavn: fornavnController.text,
                      password: passwordController1.text,
                    );
                  }
                },
                style: TextButton.styleFrom(
                  minimumSize: Size(330, 40),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  primary: Colors.white,
                  backgroundColor: Palette.buttonColor,
                  elevation: 3,
                ),
                child: Text(
                  "Registrer",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      );
  }
}
