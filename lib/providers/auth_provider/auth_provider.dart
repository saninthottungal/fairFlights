import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  AuthProvider() {
    getUserState();
  }
  final FirebaseAuth auth = FirebaseAuth.instance;
  User? user;

  void getUserState() {
    auth.authStateChanges().listen((event) {
      user = event;
    });
    notifyListeners();
  }
}
