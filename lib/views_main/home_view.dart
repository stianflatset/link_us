import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:link_us/services/database_manager.dart';
import 'package:link_us/services/palette.dart';

// UI for home

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  // Getting the logged in user info from database
  List userList = [];
  @override
  void initState() {
    super.initState();
    fetchDatabaseList();
  }
  fetchDatabaseList() async {
    dynamic result = await DatabaseManager().getUser();
    if(result == null) {
      print("Feil ved innlasting av bruker info");
    } else {
      setState(() {
        userList = result;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 50),
        //Showing the logged in user with option to share
        Container(
          width: MediaQuery.of(context).size.width*0.85,
          height: MediaQuery.of(context).size.height*0.18,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            //border: Border.all(color: Colors.black),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: 15,
                spreadRadius: 5,
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 3,
                    color: Theme.of(context).scaffoldBackgroundColor
                  ),
                  boxShadow: [BoxShadow(spreadRadius: 1, blurRadius: 15, color: Colors.black.withOpacity(0.1),offset: Offset(0,10))],
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/images/ikon_logo.png"),
                  ),
                ),
              ),
              // User name
              Text('$userList', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              // Button to share contact info
              Container(
                height: 80,
                width: 80,
                child: FlatButton(
                  onPressed: () {},
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(CommunityMaterialIcons.inbox_arrow_up, size: 40.0, color: Palette.navbarColor),
                      Text('Del', style: TextStyle(fontSize: 16.0),),
                    ],
                    ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
