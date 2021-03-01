import 'package:flutter/material.dart';
import 'login_view.dart';
import 'sign_up_view.dart';
import 'package:link_us/services/palette.dart';

// Menu controller for the login / sign up widgets.
class LoginRegMenu extends StatefulWidget {
  @override
  _LoginRegMenuState createState() => _LoginRegMenuState();
}

class _LoginRegMenuState extends State<LoginRegMenu> {
  //Controller for the buttons to switch PageView
  PageController pageController = PageController(initialPage: 0);

  // Checking if user is on logg inn or registrer
  int _selectedItem = 0;

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;

    //UI for choosing between Logg inn or Registrer
    return Scaffold(
      body: Container(
          child: Stack(
            //Code for the menu of login/reg
            children: <Widget>[
              // Top of the stack - Logo
              Positioned(
                top: 20,
                left: 25,
                right: 25,
                child: Container(
                  height: _height * 0.15,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/liten_logo_hvit.png"),
                        fit: BoxFit.fill),
                  ),
                ),
              ),
              // Show either Logg inn or Registrer
              Positioned(
                top: _height*0.20,
                child: Container(
                  height: _height*0.75,
                  padding: EdgeInsets.all(20),
                  width: _width * 0.9,
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          blurRadius: 15,
                          spreadRadius: 5,
                        )
                      ]),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _selectedItem = 0;
                                pageController.animateToPage(0,
                                    duration: Duration(milliseconds: 250),
                                    curve: Curves.easeInOut);
                              });
                            },
                            child: Column(
                              children: [
                                Text(
                                  "Logg inn",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: _selectedItem == 0 ? Palette.activeColor : Palette.textColor1,
                                  ),
                                ),
                                if (_selectedItem == 0)
                                  Container(
                                    margin: EdgeInsets.only(top: 1),
                                    height: 2,
                                    width: 70,
                                    color: Colors.orange,
                                  ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _selectedItem = 1;
                                pageController.animateToPage(1,
                                    duration: Duration(milliseconds: 250),
                                    curve: Curves.easeInOut);
                              });
                            },
                            child: Column(
                              children: [
                                Text(
                                  "Registrer",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: _selectedItem == 1
                                        ? Palette.activeColor
                                        : Palette.textColor1,
                                  ),
                                ),
                                if (_selectedItem == 1)
                                  Container(
                                    margin: EdgeInsets.only(top: 1),
                                    height: 2,
                                    width: 70,
                                    color: Colors.orange,
                                  ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      // PageView to update to either Login_view or sign_up_view
                      Expanded(
                        child: PageView(
                          onPageChanged: (index) {
                            setState(() {
                              _selectedItem = index;
                            });
                          },
                          controller: pageController,
                          children: [
                            LoginView(),
                            SignUpView(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          //Color of the body
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                Color.fromRGBO(205, 199, 41, 1.0),
                Color.fromRGBO(170, 210, 30, 1.0),
              ]))),
    );
  }
}
