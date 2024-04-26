import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flight_booking/core/constants/enums.dart';
import 'package:flight_booking/services/auth/auth_functions.dart';
import 'package:flutter/material.dart';

class AuthStateProvider extends ChangeNotifier {
  AuthStateProvider() {
    setUserState();
  }
  final FirebaseAuth authInstance = FirebaseAuth.instance;
  User? user;
  late UserState userCurrentState;
  final AuthFunctions _authFunctions =
      AuthFunctions(autInstance: FirebaseAuth.instance);

  void setUserState() async {
    user = authInstance.currentUser;
    userCurrentState = user == null
        ? UserState.loggedOut
        : user!.emailVerified
            ? UserState.loggedIn
            : UserState.loggedInEmailNotVerified;
    notifyListeners();
  }

  //get usermail
  String? get userMail => user?.email;

  //signIn
  Future<void> signIn({required String email, required String password}) async {
    await _authFunctions.signIn(email: email, password: password);
    setUserState();
  }

  //signUp
  Future<void> signUp({required String email, required String password}) async {
    await _authFunctions.signUp(email: email, password: password);
    setUserState();
  }

  //signout

  Future<void> signOut() async {
    await _authFunctions.signOut();
    setUserState();
  }

  //emailverification

  Future<void> sendEmailVerification() async {
    await _authFunctions.mailVerification();
    setUserState();
  }

  //passwordReset
  Future<void> resetPassword({required String email}) async {
    await _authFunctions.resetPassword(email: email);
    setUserState();
  }

  //reloadUser
  Future<void> reloadUser() async {
    await _authFunctions.reloadUser();
    setUserState();
  }
}
