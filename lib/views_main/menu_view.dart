import 'package:flutter/material.dart';

// UI for menu

class MenuView extends StatefulWidget {
  @override
  _MenuViewState createState() => _MenuViewState();
}

class _MenuViewState extends State<MenuView> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child:
      Text('Du er i menyen'),
    );
  }
}
