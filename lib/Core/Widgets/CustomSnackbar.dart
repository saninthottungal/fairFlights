import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomSnackbar {
  static void show({required BuildContext context, required String message}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.red,
      ),
    );
  }
}
