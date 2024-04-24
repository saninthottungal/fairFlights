import 'package:flutter/material.dart';

class FromToColumn extends StatelessWidget {
  const FromToColumn({
    super.key,
    required this.cityCode,
    required this.cityName,
  });

  final String cityCode;
  final String cityName;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const Text(
          "FROM",
          style: TextStyle(
            letterSpacing: 2,
            fontWeight: FontWeight.w400,
            fontSize: 14,
            color: Colors.white,
          ),
        ),
        Text(
          cityCode,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 45,
            letterSpacing: 2,
            color: Colors.white,
          ),
        ),
        SizedBox(
          width: 140,
          child: Text(
            cityName,
            textAlign: TextAlign.center,
            style: const TextStyle(
              letterSpacing: 2,
              fontSize: 18,
              fontWeight: FontWeight.w300,
              color: Colors.white,
            ),
            // softWrap: true,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
