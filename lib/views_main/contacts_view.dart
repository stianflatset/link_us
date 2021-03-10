import 'package:flutter/material.dart';
import 'package:link_us/services/nfc_sjekk.dart';
// UI for contacts

class ContactsView extends StatefulWidget {
  @override
  _ContactsViewState createState() => _ContactsViewState();
}
 String input = "";


class _ContactsViewState extends State<ContactsView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [

            RaisedButton(
            onPressed: () {
              print("Les");
              String textIn = lesNfc();
              setState(() {
                input =textIn;
              });
            },
            child: Text("Les Nfc"),
            color: Colors.lightBlue,
          ),
            RaisedButton(
              onPressed: () {
                print("Skriv");
                skrivNfc();
              },
              child: Text("Skriv Nfc"),
              color: Colors.lightBlue,
            ),
            Text('Mottat: ${input}'),

          ]


        ),

      ),

    );
  }
}
