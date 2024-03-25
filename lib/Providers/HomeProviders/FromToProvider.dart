import 'package:flight_booking/Core/Constants/enums.dart';
import 'package:flight_booking/Services/Api/CitySearch/city_model/city_model.dart';
import 'package:flutter/cupertino.dart';

class FromToProvider extends ChangeNotifier {
  CityModel from = CityModel();
  CityModel to = CityModel();
  SelectedField selectedField = SelectedField.fromField;

  set changeFromValue(CityModel value) {
    from = value;
    notifyListeners();
  }

  set changeToValue(CityModel value) {
    to = value;
    notifyListeners();
  }
}
