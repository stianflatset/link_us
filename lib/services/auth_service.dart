import 'package:firebase_auth/firebase_auth.dart';

// Functions for authenticating in firebase

class AuthService {
  final FirebaseAuth _firebaseAuth;

  AuthService(this._firebaseAuth);

  Stream<User> get onAuthStateChange => _firebaseAuth.authStateChanges();

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  //Signing into the app through firebase auth
  Future<String> signIn({String email, String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
          return "Signed in";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  //Sign up into the app through firebase auth
  Future<String> signUp({String email, String password}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      return ("Signed up");
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }


}