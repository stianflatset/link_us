import 'package:flutter/material.dart';
import 'package:link_us/views_login_reg/login_reg_menu.dart';
import 'package:link_us/views_main/navigation_view.dart';
import 'package:link_us/services/auth_service.dart';
import 'package:link_us/views_login_reg/login_view.dart';
import 'views_login_reg/sign_up_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      auth: AuthService(),
      child: MaterialApp(
        home: HomeController(),
        routes: <String, WidgetBuilder> {
          '/Login or Signup': (BuildContext context) => LoginRegMenu(),
          '/home': (BuildContext context) => HomeController(),
        },
      ),
    );
  }
}

// Checks if a user is signed in to route to either home or login view
class HomeController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AuthService auth = Provider.of(context).auth;
    return StreamBuilder(
        stream: auth.onAuthStateChange,
        builder: (context, AsyncSnapshot<String> snapshot) {
          if(snapshot.connectionState == ConnectionState.active) {
            final bool signedIn = snapshot.hasData;
            return signedIn ? Home() : LoginRegMenu();
          }
          return CircularProgressIndicator();
        },
    );
  }
}
// Provider updates auth throughout the app
class Provider extends InheritedWidget {
  final AuthService auth;
  Provider({Key key, Widget child, this.auth}) : super(key: key, child: child);
  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }
  static Provider of(BuildContext context) => (context.dependOnInheritedWidgetOfExactType<Provider>());
}

