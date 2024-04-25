import 'package:flight_booking/core/constants/enums.dart';
import 'package:flutter/material.dart';

class AuthModeProvider extends ChangeNotifier {
  AuthMode selectedMode = AuthMode.signin;

  set setAuthMode(AuthMode value) {
    selectedMode = value;
    notifyListeners();
  }
}
