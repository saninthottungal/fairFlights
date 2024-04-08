import 'package:flutter/material.dart';

class DataLoadingProvider extends ChangeNotifier {
  bool isLoading = true;

  set setIsLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }
}
