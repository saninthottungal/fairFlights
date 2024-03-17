import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FromToColumn extends StatelessWidget {
  const FromToColumn(
      {super.key, required this.cityCode, required this.cityName});

  final String cityCode;
  final String cityName;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "FROM",
          style: TextStyle(
            letterSpacing: 2,
            fontWeight: FontWeight.w400,
            fontSize: 14,
          ),
        ),
        Text(
          cityCode,
          style: const TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 45,
            letterSpacing: 2,
            fontStyle: FontStyle.italic,
          ),
        ),
        Text(
          cityName,
          style: const TextStyle(
            letterSpacing: 2,
            fontSize: 18,
            fontWeight: FontWeight.w300,
          ),
        ),
      ],
    );
  }
}
