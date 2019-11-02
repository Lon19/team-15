import 'package:firebase_auth/firebase_auth.dart';

Future<FirebaseUser> signIn(String email, String password) async {
  AuthResult result = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email, password: password);
  FirebaseUser user = result.user;
  return user;
}