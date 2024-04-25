import 'package:flutter/material.dart';

class PassProvider extends ChangeNotifier {
  bool isVisible = false;

  void changeIsVisible() {
    isVisible = !isVisible;
    notifyListeners();
  }
}
