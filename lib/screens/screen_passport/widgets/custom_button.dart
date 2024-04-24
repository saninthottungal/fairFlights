import 'package:flight_booking/core/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomButtonWidget extends StatelessWidget {
  final void Function()? onPressed;
  final String childTitle;
  final double? width;

  const CustomButtonWidget({
    super.key,
    required this.childTitle,
    required this.onPressed,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: 45,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(AppColor.customBlue),
        ),
        child: Text(
          childTitle,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
