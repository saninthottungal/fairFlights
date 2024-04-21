import 'package:flight_booking/core/constants/enums.dart';
import 'package:flutter/material.dart';

class TravellerClassProvider extends ChangeNotifier {
  int travellerCount = 1;
  ClassType classType = ClassType.economy;

  set setTravellersCount(int value) {
    travellerCount = value;
    notifyListeners();
  }

  set setClassType(ClassType value) {
    classType = value;
    notifyListeners();
  }
}
