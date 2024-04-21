import 'package:flight_booking/core/constants/enums.dart';
import 'package:flutter/material.dart';

class ClassChipProvider extends ChangeNotifier {
  ClassType selectedType = ClassType.economy;

  void onChanged(ClassType newType) {
    selectedType = newType;
    notifyListeners();
  }
}
