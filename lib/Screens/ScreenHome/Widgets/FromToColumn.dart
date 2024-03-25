import 'package:flutter/cupertino.dart';
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
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const Text(
          "FROM",
          style: TextStyle(
            letterSpacing: 2,
            fontWeight: FontWeight.w400,
            fontSize: 14,
            // overflow: TextOverflow.ellipsis,
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
        SizedBox(
          width: 140,
          child: Text(
            cityName,
            textAlign: TextAlign.center,
            style: const TextStyle(
              letterSpacing: 2,
              fontSize: 18,
              fontWeight: FontWeight.w300,
            ),
            // softWrap: true,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
