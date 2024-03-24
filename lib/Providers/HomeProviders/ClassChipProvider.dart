import 'package:flight_booking/Core/Constants/enums.dart';
import 'package:flutter/material.dart';

class ClassChipProvider extends ChangeNotifier {
  ClassType selectedType = ClassType.economy;

  void onChanged(ClassType newType) {
    selectedType = newType;
    notifyListeners();
  }
}
