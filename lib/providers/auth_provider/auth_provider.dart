import 'package:firebase_auth/firebase_auth.dart';
import 'package:flight_booking/services/auth/auth_functions.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  AuthProvider() {
    getUserState();
  }
  final FirebaseAuth authInstance = FirebaseAuth.instance;
  User? user;
  final AuthFunctions _authFunctions =
      AuthFunctions(autInstance: FirebaseAuth.instance);

  void getUserState() {
    authInstance.authStateChanges().listen((event) {
      user = event;
    });
    notifyListeners();
  }

  //signIn
  Future<void> signIn({required String email, required String password}) async {
    await _authFunctions.signIn(email: email, password: password);
  }

  //signUp
  Future<void> signUp({required String email, required String password}) async {
    await _authFunctions.signUp(email: email, password: password);
  }

  //signout

  Future<void> signOut() async {
    await _authFunctions.signOut();
  }

  //emailverification

  Future<void> sendEmailVerification() async {
    await _authFunctions.mailVerification();
  }

  //passwordReset
  Future<void> resetPassword({required String email}) async {
    await _authFunctions.resetPassword(email: email);
  }
}
