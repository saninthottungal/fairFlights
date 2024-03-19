import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Counter extends StatelessWidget {
  const Counter({super.key, required this.title, required this.subtitle});

  final String title;
  final String subtitle;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            SizedBox(
              width: 150,
              child: Text(
                title,
                style: TextStyle(
                  color: Colors.black.withOpacity(0.75),
                  fontWeight: FontWeight.w400,
                  fontSize: 17,
                ),
              ),
            ),
            SizedBox(
              width: 150,
              child: Text(
                subtitle,
                style: const TextStyle(
                  color: Colors.black54,
                  fontSize: 11,
                ),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton.filledTonal(
                onPressed: () {},
                icon: const Icon(
                  Icons.remove,
                  color: Colors.black54,
                )),
            const SizedBox(width: 12),
            const Text(
              "1",
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
            const SizedBox(width: 12),
            IconButton.filled(
                onPressed: () {},
                icon: const Icon(
                  Icons.add,
                  color: Colors.white70,
                )),
          ],
        ),
      ],
    );
  }
}
