import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthProvider with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> signIn(String phone, String password, BuildContext context) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: '$phone@catalift.com',
        password: password,
      );
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Sign-in successful")));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Error: $e")));
    }
  }
}
