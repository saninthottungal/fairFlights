import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key, this.onTap, required this.title});

  final VoidCallback? onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: CupertinoListTile(
        onTap: onTap,
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w400,
            color: Colors.black54,
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}
