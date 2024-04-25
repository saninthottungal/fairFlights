import 'package:flutter/material.dart';

class AuthImageWidget extends StatelessWidget {
  const AuthImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Container(
      height: height * 0.35,
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fitHeight,
          image: AssetImage('assets/images/auth.png'),
        ),
      ),
    );
  }
}
