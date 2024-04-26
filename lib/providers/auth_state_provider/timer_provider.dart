import 'dart:async';

import 'package:flutter/material.dart';

class TimerProvider extends ChangeNotifier {
  Timer? timer;
  int timerCount = 30;

  void startTimer() {
    timerCount = 30;
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (timerCount <= 0) {
        timerCount = 30;
        timer?.cancel();
        notifyListeners();
      } else {
        timerCount--;
        notifyListeners();
      }
    });
  }
}
