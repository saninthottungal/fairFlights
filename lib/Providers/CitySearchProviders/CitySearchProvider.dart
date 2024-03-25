import 'package:flight_booking/Services/Api/CitySearch/city_model/city_model.dart';
import 'package:flutter/material.dart';

class CitySearchProvider extends ChangeNotifier {
  List<CityModel> cites = [];

  set updateCities(List<CityModel> values) {
    cites = values;
    notifyListeners();
  }
}
