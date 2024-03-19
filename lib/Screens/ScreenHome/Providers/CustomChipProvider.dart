import 'package:flight_booking/Screens/ScreenHome/Constants/enums.dart';
import 'package:flutter/material.dart';

class CustomChipProvider extends ChangeNotifier {
  ClassType selectedType = ClassType.economy;

  void onChanged(ClassType newType) {
    selectedType = newType;
    notifyListeners();
  }
}
