import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

Future<void> loginWithEmailAndPassword(
    FirebaseAuth auth, String email, String password) async {
  try {
    UserCredential userCredential =
        await auth.signInWithEmailAndPassword(email: email, password: password);
    User? user = userCredential.user;

    if (user != null) {
      print('Logged in as ${user.displayName}');
    }
  } catch (e) {
    print('Login Failed: $e');
  }
}

Future<void> logOut(BuildContext context, FirebaseAuth auth) async {
  try {
    await auth.signOut();
    Navigator.pushReplacementNamed(context, '/login');
  } catch (e) {
    print('Logout Failed: $e');
  }
}

Future<void> registerWithEmail(FirebaseAuth auth, String email, String password,
    String name, BuildContext context) async {
  try {
    UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email, password: password);
    User? user = userCredential.user;
    if (user == null) {
      print('Register Fail');
    } else {
      print('Register Success');
      Navigator.pushReplacementNamed(context, '/login');
    }
  } catch (e) {}
}
