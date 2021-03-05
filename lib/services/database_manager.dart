import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DatabaseManager {

  CollectionReference users = FirebaseFirestore.instance.collection('users');
  final firebaseUser = FirebaseAuth.instance.currentUser.uid;


  Future<void> addUser(String fornavn, String etternavn, String email) {
    return users.doc(firebaseUser).set({
      'fornavn' : fornavn,
      'etternavn' : etternavn,
      'email' : email,
    });
  }

  Future getUser() async {
    List userList = [];
    try {
      await FirebaseFirestore.instance.collection('users').doc(firebaseUser).get().then((DocumentSnapshot documentSnapshot) {
        if (documentSnapshot.exists) {
          userList.add(documentSnapshot.data());
        }
      }); return userList;
    }catch (e) {
      print(e.toString());
    }
  }
}

