import 'package:flutter/material.dart';
import 'package:link_us/services/palette.dart';
import 'package:link_us/views_main/home_view.dart';
import 'package:link_us/views_main/contacts_view.dart';
import 'package:link_us/views_main/gps_view.dart';
import 'package:link_us/views_main/my_profile_view.dart';
import 'package:link_us/views_main/menu_view.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

//Navigator for the bottom navbar
//Updates the UI accordingly
class _HomeState extends State<Home> {
  int _selectedItem = 0;
  var _pages = [
    HomeView(),
    ContactsView(),
    MyProfileView(),
    GpsView(),
    MenuView()
  ];
  var _pageController = PageController();

  //building the bottom navbar
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: _pages,
        onPageChanged: (index) {
          setState(() {
            _selectedItem = index;
          });
        },
        controller: _pageController,
      ),
      // Create and styling the Bottom Nav Bar
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        iconSize: 26.0,
        selectedFontSize: 16.0,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Hjem', backgroundColor: Palette.navbarColor),
          BottomNavigationBarItem(icon: Icon(Icons.contacts), label: 'Kontakter', backgroundColor: Palette.navbarColor),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Min Profil', backgroundColor: Palette.navbarColor),
          BottomNavigationBarItem(icon: Icon(Icons.pin_drop), label: 'GPS', backgroundColor: Palette.navbarColor),
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Meny', backgroundColor: Palette.navbarColor),
        ],
        currentIndex: _selectedItem,
        onTap: (index) {
          setState(() {
            _selectedItem = index;
            _pageController.jumpToPage(_selectedItem);
          });
        },
      ),
    );
  }
}