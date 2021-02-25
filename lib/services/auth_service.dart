import 'package:firebase_auth/firebase_auth.dart';

// Functions for authenticating in firebase

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Stream<String> get onAuthStateChange =>
      _firebaseAuth.authStateChanges().map(
            (User user) => user?.uid,
      );

  // Email & password Sign Up from firebase
  Future<String> createUserWithEmailAndPassword(String email, String password, String name) async {
    final currentUser = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password
    );
    // Update the username
    Future updateUserName(String name, User currentUser) async {
      await FirebaseAuth.instance.currentUser.updateProfile(displayName: currentUser.displayName);
      return currentUser.uid;
    }
  }

  // Email & Password Sign in using firebase
  Future<String> signInWithEmailAndPassword(String email, String password) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch(e) {
      return e.message;
    }
  }

  // Sign out from the app through firebase
  Future signOut() async {
    try {
      return await _firebaseAuth.signOut();
    } catch(e) {
      print(e.toString());
      return null;
    }
  }


}