import 'package:flight_booking/models/city_model/city_model.dart';
import 'package:flutter/material.dart';

class CitySearchProvider extends ChangeNotifier {
  bool isLoading = false;
  List<CityModel> cites = [];
  bool isEmpty = false;
  bool firstLoading = true;

  set updateCities(List<CityModel> values) {
    cites = values;
    notifyListeners();
  }

  set loading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  set setEmpty(bool value) {
    isEmpty = value;
  }

  set setFirstLoading(bool value) {
    firstLoading = value;
  }
}
