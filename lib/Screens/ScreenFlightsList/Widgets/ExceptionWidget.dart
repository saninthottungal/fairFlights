import 'package:flight_booking/Core/Constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExceptionWidget extends StatelessWidget {
  const ExceptionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.warning_amber_outlined,
              size: 100,
              color: Colors.black45,
            ),
            CupertinoButton(
                pressedOpacity: 0.9,
                color: AppColor.customBlue,
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("Try new Search")),
          ],
        ),
      ),
    );
  }
}
