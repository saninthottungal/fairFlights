import 'package:flight_booking/core/constants/enums.dart';
import 'package:flutter/cupertino.dart';

class CalendarProvider extends ChangeNotifier {
  DateTime departureDate = DateTime.now();
  DateTime returnDate = DateTime.now().add(const Duration(days: 1));
  TripWay way = TripWay.departureWay;

  set changeDepartureDate(DateTime dateTime) {
    departureDate = dateTime;
    notifyListeners();
  }

  set changeReturnDate(DateTime dateTime) {
    returnDate = dateTime;
    notifyListeners();
  }
}
