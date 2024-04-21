import 'package:flight_booking/core/constants/enums.dart';
import 'package:flight_booking/models/city_model/city_model.dart';
import 'package:flutter/cupertino.dart';

class FromToProvider extends ChangeNotifier {
  CityModel from = CityModel(
    code: 'DXB',
    countryName: "United Arab Emirates",
    cityName: 'Dubai',
    name: 'Dubai',
  );
  CityModel to = CityModel(
    code: 'COK',
    countryName: "India",
    cityName: 'Kochi',
    name: 'Kochi',
  );
  SelectedField selectedField = SelectedField.fromField;

  set changeFromValue(CityModel value) {
    from = value;
    notifyListeners();
  }

  set changeToValue(CityModel value) {
    to = value;
    notifyListeners();
  }

  set changeSelectedField(SelectedField value) {
    selectedField = value;
    notifyListeners();
  }
}
