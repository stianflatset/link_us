import 'package:flutter/material.dart';

// UI for home

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //Logo at the top
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/ikon_logo.png"),
                  fit: BoxFit.fill),
                ),
              ),
            // MAYBE ADD A SEARCH FIELD?
          ],
        ),
        //Showing the logged in user with option to share
        Container(
          width: MediaQuery.of(context).size.width*0.85,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("Bilde"),
              Text("Navn"),
              Text("Share"),
            ],
          ),
        ),

      ],
    );
  }
}
