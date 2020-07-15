import 'package:firebase_auth/firebase_auth.dart';


class AuthServices {
  static Future <FirebaseUser> signInUser(email, password) {
    return FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password).then((value) => value.user);
  }
  static Future <FirebaseUser> registerUser(email, password) {
    return FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password).then((value) => value.user);
  }

}

