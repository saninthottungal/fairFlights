import 'package:flight_booking/Screens/ScreenHome/Constants/enums.dart';
import 'package:flutter/material.dart';

class ChoiceProvider extends ChangeNotifier {
  TripType value = TripType.oneWay;

  void changeValue(TripType newValue) {
    value = newValue;
    notifyListeners();
  }
}
