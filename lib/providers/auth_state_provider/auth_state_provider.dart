import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flight_booking/core/constants/enums.dart';
import 'package:flight_booking/services/auth/auth_functions.dart';
import 'package:flight_booking/services/exception/auth_exceptions.dart';
import 'package:flight_booking/services/exception/network_exceptions.dart';
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
  Future<String?> signIn(
      {required String email, required String password}) async {
    try {
      await _authFunctions.signIn(email: email, password: password);
    } on InvalidEmailException {
      return 'Invalid E-mail provided.';
    } on UserDisabledException {
      return 'User is disabled.';
    } on UserNotFoundException {
      return 'No user found, try signing up.';
    } on WrongPasswordException {
      return 'Wrong password entered';
    } on Network404Exception {
      return 'No network connection found.';
    } on GenericException {
      return 'Unknown error occured';
    }
    setUserState();
    return null;
  }

  //signUp
  Future<String?> signUp(
      {required String email, required String password}) async {
    try {
      await _authFunctions.signUp(email: email, password: password);
    } on InvalidEmailException {
      return 'Invalid E-mail provided.';
    } on EmailAlreadyInUseException {
      return 'E-mail is already in use';
    } on WeakPasswordException {
      return 'password should container atleast 6 characters';
    } on OperationNotAllowedException {
      return 'temporarily operation blocked';
    } on Network404Exception {
      return 'No network connection found.';
    } on GenericException {
      return 'Unknown error occured';
    }

    setUserState();
    return null;
  }

  //signout

  Future<String?> signOut() async {
    try {
      await _authFunctions.signOut();
    } on Network404Exception {
      return 'No network connection found.';
    } on GenericException {
      return 'Unknown error occured';
    }

    setUserState();
    return null;
  }

  //emailverification

  Future<String?> sendEmailVerification() async {
    try {
      await _authFunctions.mailVerification();
    } on UserNotFoundException {
      return 'No user found, try signing up.';
    } on Network404Exception {
      return 'No network connection found.';
    } on GenericException {
      return 'Unknown error occured';
    }
    setUserState();
    return null;
  }

  //passwordReset
  Future<String?> resetPassword({required String email}) async {
    try {
      await _authFunctions.resetPassword(email: email);
    } on InvalidEmailException {
      return 'Invalid E-mail provided.';
    } on UserNotFoundException {
      return 'No user found, try signing up.';
    } on Network404Exception {
      return 'No network connection found.';
    } on GenericException {
      return 'Unknown error occured';
    }
    setUserState();
    return null;
  }

  //reloadUser
  Future<String?> reloadUser() async {
    try {
      await _authFunctions.reloadUser();
    } on UserNotFoundException {
      return 'No user found, try signing up.';
    } on Network404Exception {
      return 'No network connection found.';
    } on GenericException {
      return 'Unknown error occured';
    }
    setUserState();
    return null;
  }
}
