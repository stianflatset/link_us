import 'package:flutter/material.dart';
import 'package:link_us/views/home_view.dart';
import 'package:link_us/views/contacts_view.dart';
import 'package:link_us/views/gps_view.dart';
import 'package:link_us/views/my_profile_view.dart';
import 'package:link_us/views/menu_view.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

//Navigator for the bottom navbar
class _HomeState extends State<Home> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    HomeView(),
    ContactsView(),
    MyProfileView(),
    GpsView(),
    MenuView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.shifting,
        selectedItemColor: Colors.yellow,
        iconSize: 26.0,
        selectedFontSize: 16.0,
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            label: 'Hjem',
            backgroundColor: Colors.grey[850],
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.contacts),
            label: 'Kontakter',
            backgroundColor: Colors.grey[850],
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.person),
            label: 'Min Profil',
            backgroundColor: Colors.grey[850],
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.pin_drop),
            label: 'GPS',
            backgroundColor: Colors.grey[850],
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.menu),
            label: 'Meny',
            backgroundColor: Colors.grey[850],
          ),
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
