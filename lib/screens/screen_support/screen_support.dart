import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'widgets/support_container.dart';

class ScreenSupport extends StatelessWidget {
  const ScreenSupport({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 238, 240, 242),
      body: Padding(
        padding: const EdgeInsets.only(top: 15, bottom: 15, left: 12),
        child: Column(
          children: [
            Expanded(
              flex: 5,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  SupportContainerWidget(
                    bgColor: Colors.blue.shade700,
                    imagePath: 'assets/visaimage.png',
                  ),
                  SupportContainerWidget(
                    bgColor: Colors.purple.shade700,
                    imagePath: 'assets/flightbookimage.png',
                  ),
                  SupportContainerWidget(
                    bgColor: Colors.orange.shade700,
                    imagePath: 'assets/passportimage.png',
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 4,
              child: Container(
                margin: const EdgeInsets.only(right: 22, top: 20, left: 10),
                decoration: BoxDecoration(
                  color: Colors.blue.shade400,
                  borderRadius: BorderRadius.circular(15),
                ),
                height: 240,
                width: double.infinity,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
