import 'package:flutter/cupertino.dart';

class CounterProvider extends ChangeNotifier {
  int adult = 1;
  int children = 0;
  int infant = 0;
  int total = 1;

  int get travellersCount {
    total = adult + children + infant;
    return total;
  }

  void setAdultCount(int value) {
    if (value > adult && travellersCount < 9) {
      adult = value;
    } else if (value < adult && adult > 1) {
      adult = value;
    } else {}

    notifyListeners();
  }

  void setChildrenCount(int value) {
    if (value > children && travellersCount < 9) {
      children = value;
    } else if (value < children && children > 0) {
      children = value;
    } else {}
    notifyListeners();
  }

  void setInfantCount(int value) {
    if (value > infant && travellersCount < 9 && value <= adult) {
      infant = value;
    } else if (value < infant && infant > 0) {
      infant = value;
    }
    notifyListeners();
  }
}
