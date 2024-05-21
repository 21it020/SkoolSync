import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthSevice {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> sugnUpwithEmailAbdPassword(
      String email, String password) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      return credential.user;
    }
    catch (e) {
      print("some error occured");
    }
    return null;
  }


  Future<User?> signInwithEmailAbdPassword(
      String email, String password) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(email: email, password: password);
      return credential.user;
    }
    catch (e) {
      print("some error occured");
    }
    return null;
  }
}
