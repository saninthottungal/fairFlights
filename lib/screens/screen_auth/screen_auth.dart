import 'package:flutter/material.dart';

import '../../core/constants/colors.dart';

class ScreenAuth extends StatelessWidget {
  const ScreenAuth({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 35, horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const SizedBox(width: double.infinity),
            Container(
              height: height * 0.4,
              width: width * 0.7,
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
            ),
            const Text(
              "Hello",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              "Welcome to fairflights\ni'll be your mentor travel partner",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black54,
                fontSize: 16,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: SizedBox(
                width: 250,
                height: 45,
                child: ElevatedButton(
                  style: ButtonStyle(
                      foregroundColor:
                          const MaterialStatePropertyAll(Colors.white),
                      backgroundColor:
                          MaterialStatePropertyAll(AppColor.customBlue)),
                  onPressed: () {
                    Navigator.of(context).pushNamed('/login');
                  },
                  child: const Text("Login"),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: SizedBox(
                width: 250,
                height: 45,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text("Sign Up"),
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "or sign in using",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black54,
                fontSize: 16,
              ),
            ),
            Image.asset(
              'assets/images/google.png',
              height: 50,
              width: 50,
            ),
          ],
        ),
      ),
    );
  }
}
