import 'package:flutter/cupertino.dart';

class CounterProvider extends ChangeNotifier {
  int adult = 1;
  int children = 0;
  int infant = 0;

  int get travellersCount {
    int total = adult + children + infant;
    return total;
  }

  void notify() {
    notifyListeners();
  }
}
