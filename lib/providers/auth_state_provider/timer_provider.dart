import 'dart:async';

import 'package:flutter/material.dart';

class TimerProvider extends ChangeNotifier {
  Timer? timer;
  int timerCount = 15;

  void startTimer() {
    timerCount = 15;
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (timerCount <= 0) {
        timer?.cancel();
        notifyListeners();
      } else {
        timerCount--;
        notifyListeners();
      }
    });
  }
}
