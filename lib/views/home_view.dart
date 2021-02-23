import 'package:flutter/material.dart';

// UI for home

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: 
      Text('Du er på nyhetsveggen'),
    );
  }
}
