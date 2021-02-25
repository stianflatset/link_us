import 'package:flutter/material.dart';

// UI for My Profile

class MyProfileView extends StatefulWidget {
  @override
  _MyProfileViewState createState() => _MyProfileViewState();
}

class _MyProfileViewState extends State<MyProfileView> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text("Du er på Min Profil"),
    );
  }
}
