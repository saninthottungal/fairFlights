import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardField extends StatelessWidget {
  const CardField({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
            width: double.infinity,
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
            )),
        Card(
          child: TextField(
              style: const TextStyle(
                color: Colors.black,
              ),
              decoration: InputDecoration(
                // filled: true,
                // fillColor: Colors.white.withOpacity(0.6),
                contentPadding: const EdgeInsets.all(15),
                hintText: "Enter $title",
                hintStyle: const TextStyle(
                  color: Colors.black26,
                  fontSize: 15,
                ),
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
              )),
        ),
      ],
    );
  }
}
