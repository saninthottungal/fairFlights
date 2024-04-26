import 'package:flutter/material.dart';

class CustomUtilities {
  static void showSnackBar(
      {required BuildContext context, required String message}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  static void showBlankDialogue(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (ctx) => const Dialog.fullscreen(
        backgroundColor: Colors.black12,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
