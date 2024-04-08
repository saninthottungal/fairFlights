import 'package:flight_booking/Core/Constants/enums.dart';
import 'package:flutter/material.dart';

class SortProvider extends ChangeNotifier {
  SortValues selectedGroupValue = SortValues.none;

  set changeSort(SortValues value) {
    selectedGroupValue = value;
    notifyListeners();
  }
}
