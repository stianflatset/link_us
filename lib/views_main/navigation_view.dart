import 'package:flutter/material.dart';
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
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Hjem', backgroundColor: Colors.grey[800]),
          BottomNavigationBarItem(icon: Icon(Icons.contacts), label: 'Kontakter', backgroundColor: Colors.grey[800]),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Min Profil', backgroundColor: Colors.grey[800]),
          BottomNavigationBarItem(icon: Icon(Icons.pin_drop), label: 'GPS', backgroundColor: Colors.grey[800]),
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Meny', backgroundColor: Colors.grey[800]),
        ],
        currentIndex: _selectedItem,
        onTap: (index) {
          setState(() {
            _selectedItem = index;
            _pageController.animateToPage(_selectedItem, duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
          });
        },
      ),
    );
  }
}
