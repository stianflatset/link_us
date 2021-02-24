import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// Functions for authenticating in firebase

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Stream<String> get onAuthStateChange =>
      _firebaseAuth.authStateChanges().map(
            (User user) => user?.uid,
      );

  // Email & password Sign Up from firebase
  Future<String> createUserWithEmailAndPassword(String email, String password,
      String name) async {
    final currentUser = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password
    );

    // Update the username

  }
  Future updateUserName(String name, User currentUser) async {
    await FirebaseAuth.instance.currentUser.updateProfile(displayName: currentUser.displayName);
  }

}