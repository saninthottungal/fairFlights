import 'package:flutter/material.dart';

class DataLoadingProvider extends ChangeNotifier {
  bool isLoading = true;
  bool isExceptionThrown = false;

  set setIsLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  set setExceptionThrown(bool value) {
    isExceptionThrown = value;
    isLoading = true;
    notifyListeners();
  }
}
