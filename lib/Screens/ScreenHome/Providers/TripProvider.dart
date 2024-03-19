import 'package:flight_booking/Screens/ScreenHome/Constants/enums.dart';
import 'package:flutter/material.dart';

class TripProvider extends ChangeNotifier {
  TripType value = TripType.oneWay;

  void changeValue(TripType newValue) {
    value = newValue;
    notifyListeners();
  }
}
