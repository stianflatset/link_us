import 'package:flutter/material.dart';
import 'package:link_us/services/auth_service.dart';
import 'package:link_us/services/innstillinger_konstant.dart';
import 'package:provider/provider.dart';
import 'package:link_us/services/palette.dart';

// UI for menu

class MenuView extends StatefulWidget {
  @override
  _MenuViewState createState() => _MenuViewState();
}

class _MenuViewState extends State<MenuView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: IntrinsicWidth(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              RaisedButton(
                onPressed: (){},
                child: Text("Favoritter",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                ),
                color: Palette.buttonColor,
              ),
              Divider(
                height: 15.0,
                color: Colors.grey,
                thickness: 0.5,
              ),
              RaisedButton(
                onPressed: (){},
                child: Text("Personvern",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                ),
                color: Palette.buttonColor,
              ),
              Divider(
                height: 15.0,
                color: Colors.grey,
                thickness: 0.5,
              ),
              Row(
                //mainAxisAlignment: MainAxisAlignment.stretch,
                children: [
                  PopupMenuButton(
                    onSelected: choiceAction,
                    itemBuilder: (BuildContext context) {
                      return innstillinger_konstant.valg.map((String choice) {
                        return PopupMenuItem<String>(
                          value: choice,
                          child: Text(choice,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                            ),
                          )
                        );
                      }).toList();
                    },
                    child: Text("Innstillinger",
                      style: TextStyle(
                        backgroundColor: Palette.buttonColor,
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                    ),
                    color: Palette.buttonColor,
                  ),
                  Icon(Icons.arrow_downward),
                ],
              ),
              Divider(
                height: 15.0,
                color: Colors.grey,
                thickness: 0.5,
              ),
              RaisedButton(
                  onPressed: () {
                    context.read<AuthService>().signOut();
                  },
                child: Text("Logg ut",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                ),
                color: Palette.buttonColor,
              )
            ],
          ),
        ),
      ),

      
    );
  }

  void choiceAction(String choice) {
    if(choice == innstillinger_konstant.DarkMode) {
     print('DarK mode coming soon');
    }
    else if(choice == innstillinger_konstant.Aktivitet) {
      print('Aktivitet coming soon');
    }
    else if(choice == innstillinger_konstant.Betalinger) {
      print('Betalinger coming soon');
    }
  }
}
