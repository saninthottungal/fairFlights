import 'package:flutter/material.dart';

class ChoiceProvider extends ChangeNotifier {
  bool isOneWay = true;

  void changeValue(bool? value) {
    isOneWay = value ?? true;
    notifyListeners();
  }
}
