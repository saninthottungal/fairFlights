import 'package:flutter/material.dart';

class LogoRowWidget extends StatelessWidget {
  final String title;
  final String imagePath;
  const LogoRowWidget({
    super.key,
    required this.imagePath,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          imagePath,
          height: 55,
          width: 55,
        ),
        const SizedBox(width: 5),
        Text(
          title,
          style: TextStyle(
            color: Colors.black.withOpacity(0.8),
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}
