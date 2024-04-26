import 'package:flight_booking/screens/screen_passport/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class CustomAuthWidget extends StatelessWidget {
  const CustomAuthWidget({
    super.key,
    required this.imagePath,
    required this.title,
    required this.onpressed,
  });

  final String imagePath;
  final String title;
  final VoidCallback onpressed;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 25),
          height: height * 0.2,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(imagePath),
            ),
          ),
        ),
        CustomButtonWidget(
          childTitle: title,
          onPressed: onpressed,
        )
      ],
    );
  }
}
