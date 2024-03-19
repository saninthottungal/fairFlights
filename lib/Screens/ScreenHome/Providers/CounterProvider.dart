import 'package:flutter/cupertino.dart';

class CounterProvider extends ChangeNotifier {
  int adult = 1;
  int children = 0;
  int infant = 0;

  void notify() {
    notifyListeners();
  }
}
