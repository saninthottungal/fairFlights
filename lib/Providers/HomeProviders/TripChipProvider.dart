import 'package:flight_booking/Core/Constants/enums.dart';
import 'package:flutter/material.dart';

class TripChipProvider extends ChangeNotifier {
  TripType value = TripType.oneWay;

  void changeValue(TripType newValue) {
    value = newValue;
    notifyListeners();
  }
}
