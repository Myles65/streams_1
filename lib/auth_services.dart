import 'package:firebase_auth/firebase_auth.dart';


class AuthServices {
  static Future <AuthResult> signInUser(email, password) {
    return FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password).then((value) => value);
  }
  static Future <AuthResult> registerUser(email, password) {
    return FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password).then((value) => value);
  }
 static Future <AuthResult> signOut(email, password){
    return FirebaseAuth.instance.signOut().then((_){
      print('success logging out');
    }).catchError((e) {
      print('failure logging out');
      print(e);
    });

 }
}

