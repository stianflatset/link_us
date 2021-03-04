import 'package:firebase_auth/firebase_auth.dart';
import 'package:link_us/services/database_manager.dart';

// Functions for authenticating in firebase

class AuthService {
  final FirebaseAuth _firebaseAuth;

  AuthService(this._firebaseAuth);

  // Stream updates the app if anythings changes to the Auth state
  Stream<User> get onAuthStateChange => _firebaseAuth.authStateChanges();



  // Sign out from the application
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  //Signing into the app through firebase auth with email and password
  Future<String> signIn({String email, String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
          return "Signed in";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  //Sign up into the app through firebase auth with email and password
  Future<String> signUp({String email, String password, String fornavn, String etternavn}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password).then((value) => DatabaseManager().addUser(fornavn, etternavn, email));
      return ("Signed up");
    } on FirebaseAuthException catch (e) {
      return e.message;
    }

  }


}