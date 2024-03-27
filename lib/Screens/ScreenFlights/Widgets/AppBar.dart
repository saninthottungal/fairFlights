import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return AppBar(
        centerTitle: false,
        actions: [
          IconButton(onPressed: onPressed, icon: const Icon(Icons.sort)),
        ],
        title: const Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              child: Text(
                'Kozhikode - Delhi',
                textAlign: TextAlign.start,
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: Text(
                "16 April, 1 passenger",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            )
          ],
        ));
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
