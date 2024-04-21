import 'package:flutter/material.dart';

class Counter extends StatelessWidget {
  const Counter({
    super.key,
    required this.title,
    required this.subtitle,
    required this.count,
    required this.onPressedOnAdd,
    required this.onPressedOnRemove,
  });

  final String title;
  final String subtitle;
  final int count;
  final void Function() onPressedOnAdd;
  final void Function() onPressedOnRemove;
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
                  fontSize: 16,
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
                onPressed: onPressedOnRemove,
                icon: const Icon(
                  Icons.remove,
                  color: Colors.black54,
                )),
            const SizedBox(width: 12),
            Text(
              count.toString(),
              style: const TextStyle(color: Colors.black, fontSize: 16),
            ),
            const SizedBox(width: 12),
            IconButton.filled(
                onPressed: onPressedOnAdd,
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
