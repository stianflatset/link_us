import 'package:cloud_firestore/cloud_firestore.dart';


class DatabaseManager {

  CollectionReference users = FirebaseFirestore.instance.collection('users');

  Future<void> addUser(String fornavn, String etternavn, String email) {
    return users.add({
      'fornavn' : fornavn,
      'etternavn' : etternavn,
      'email' : email
    });
  }

  Future getUser() async {
    List userList = [];
    // print("we here");
    try {
      // GetFirebaseUser();
      await users.get().then((QuerySnapshot querySnapshot) => {
        // print("help"),
        querySnapshot.docs.forEach((doc) {
          userList.add(doc.data());
        })
      });
      return userList;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

}
