import 'package:flutter/material.dart';

class CustomUtilities {
  static void showSnackBar({
    required BuildContext context,
    required String message,
    bool? isGreen,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
        backgroundColor: isGreen == null || isGreen == false
            ? Colors.red.shade400
            : Colors.green.shade400,
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
