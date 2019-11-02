import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<FirebaseUser> signIn(String email, String password) async {
  AuthResult result = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email, password: password);
  FirebaseUser user = result.user;
  return user;
}

Future<FirebaseUser> signUp(String email, String password) async {
  AuthResult result = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email, password: password);
  FirebaseUser user = result.user;
  return user;
}

void addUserToDB(String email, String fullName, String uID){
  var newUser = {
    "email": email,
    "name": fullName,
  };
  print("userID: " + uID);
  Firestore.instance.collection('users').document(uID).setData(newUser);
}

Future<String> getCurrentUserEmail() async {
  FirebaseUser currentUser = await FirebaseAuth.instance.currentUser();
  return currentUser.email;
}