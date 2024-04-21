import 'package:flutter/material.dart';

class AgencyProvider extends ChangeNotifier {
  String price = '';
  String airline = '';

  set setPrice(String value) {
    price = value;
    notifyListeners();
  }

  set setAirline(String value) {
    airline = value;
    notifyListeners();
  }
}
