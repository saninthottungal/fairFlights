import 'package:flutter/material.dart';

class AuthImageWidget extends StatelessWidget {
  const AuthImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Container(
      height: height * 0.35,
      width: double.infinity,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.blue,
          width: 5,
          strokeAlign: BorderSide.strokeAlignOutside,
        ),
        image: const DecorationImage(
          fit: BoxFit.fitHeight,
          image: AssetImage('assets/images/auth.jpg'),
        ),
      ),
    );
  }
}
