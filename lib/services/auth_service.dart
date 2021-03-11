import 'package:firebase_auth/firebase_auth.dart';
import 'package:link_us/services/database_manager.dart';

// Functions for authenticating in firebase

class AuthService {
  final FirebaseAuth _firebaseAuth;
  String error = '';

  AuthService(this._firebaseAuth);

  // Stream updates the app if anythings changes to the Auth state
  Stream<User> get onAuthStateChange => _firebaseAuth.authStateChanges();



  // Sign out from the application
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }


  Future<String> signInWithEmailAndPassword(String email, String password) async {
    return (await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password)).toString();
  }

  //Signing into the app through firebase auth with email and password
  Future<String> signIn({String email, String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
          return "Signed in";
    } on FirebaseAuthException catch (e) {
      if(e.code =='user-not-found') {
        return e.message;
      } else if (e.code=='wrong-password'){
        //return e.message;
      }
      return e.message;
    } catch (e) {return (e);}
  }


  //Sign up into the app through firebase auth with email and password
  Future<String> signUp({String email, String password, String fornavn, String etternavn}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password).then((value) => DatabaseManager().addUser(fornavn, etternavn, email));
      return ("Signed up");
    } on FirebaseAuthException catch (e) {
      print('error');
      return e.message;
    }
  }
/*
  Future<String> getKontaktListe(String brukerId){
    try{

    }

  }*/
}
