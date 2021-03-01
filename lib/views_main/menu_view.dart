import 'package:flutter/material.dart';
import 'package:link_us/services/auth_service.dart';
import 'package:provider/provider.dart';

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
      RaisedButton(
        child: Text("Logg ut"),
          onPressed: () {
        context.read<AuthService>().signOut();
      }
      )
      
    );
  }
}
