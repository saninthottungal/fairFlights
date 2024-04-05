import 'package:flight_booking/Core/Constants/enums.dart';
import 'package:flight_booking/Models/CityModel/CityModel.dart';
import 'package:flutter/cupertino.dart';

class FromToProvider extends ChangeNotifier {
  CityModel from = CityModel(
      code: 'DXB', countryName: "United Arab Emirates", cityName: 'Dubai');
  CityModel to =
      CityModel(code: 'COK', countryName: "India", cityName: 'Kochi');
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
