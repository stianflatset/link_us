import 'package:flutter/material.dart';
import 'package:link_us/views_login_reg/login_reg_menu.dart';
import 'package:link_us/views_main/navigation_view.dart';
import 'package:link_us/services/auth_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider<AuthService>(
              create: (_) => AuthService(FirebaseAuth.instance),
          ),
          StreamProvider(
            create: (context) => context.read<AuthService>().onAuthStateChange,
          ),
        ],
      child: MaterialApp(
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomeController(),
      ),
    );

  }
}
// Checks if the user is logged in or not
class HomeController extends StatelessWidget {
  const HomeController({
    Key key,
}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();
    if(firebaseUser != null) {
      return Home();
    }
    return LoginRegMenu();
  }
}


