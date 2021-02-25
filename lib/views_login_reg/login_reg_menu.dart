import 'package:flutter/material.dart';
import 'login_view.dart';
import 'sign_up_view.dart';

class LoginRegMenu extends StatefulWidget {
  @override
  _LoginRegMenuState createState() => _LoginRegMenuState();
}

class _LoginRegMenuState extends State<LoginRegMenu> {

  //Controller for the buttons to switch PageView
  PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {

    //UI for choosing between Logg inn or Registrer
    return Scaffold(
      body: Container(
        //Code for the menu of login/reg
        child: SafeArea(
          child: Column(
            children: <Widget>[
              //Loading the logo
              Image.asset("assets/images/liten_logo_hvit.png"),
              // Creating Logg inn and Registrer buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FlatButton.icon(onPressed: () {
                    pageController.animateToPage(0, duration: Duration(milliseconds: 250), curve: Curves.easeInOut);
                  },
                      textColor: Colors.white,
                      icon: Icon(Icons.login),
                      label: Text("Logg inn")
                  ),
                  SizedBox(width: 50.0,),
                  FlatButton.icon(onPressed: () {
                    pageController.animateToPage(1, duration: Duration(milliseconds: 250), curve: Curves.easeInOut);
                  },
                      textColor: Colors.white,
                      icon: Icon(Icons.person_add),
                      label: Text("Registrer")
                  ),
                ],
              ),
              // Presenting login_view or sign_up_view
              Expanded(
                child: PageView(
                  controller: pageController,
                  children: <Widget>[
                    LoginView(),
                    SignUpView(),
                  ],
                ),
              ),
            ],


          ),
        ),
        //Color of the body
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromRGBO(205, 199, 41, 1.0),
                  Color.fromRGBO(112, 173, 71, 1.0),
                ]
            )
        ),
      ),
    );
  }
}
