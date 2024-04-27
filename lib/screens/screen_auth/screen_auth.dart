import 'package:flight_booking/core/constants/enums.dart';
import 'package:flight_booking/providers/auth_service_provider/auth_mode_provider.dart';
import 'package:flight_booking/screens/screen_auth/widgets/auth_image_widget.dart';
import 'package:flight_booking/screens/screen_passport/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScreenAuth extends StatelessWidget {
  const ScreenAuth({super.key});

  @override
  Widget build(BuildContext context) {
    final authModeProvider =
        Provider.of<AuthModeProvider>(context, listen: false);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const SizedBox(height: 50),
            //image widget
            const AuthImageWidget(),
            const Text(
              "Hello",
              style: TextStyle(
                fontSize: 45,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              "Welcome to fairflights\ni'll be your mentor travel partner.",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black54,
                fontSize: 16,
              ),
            ),
            CustomButtonWidget(
              childTitle: 'Login',
              width: 250,
              onPressed: () {
                authModeProvider.setAuthMode = AuthMode.signin;
                Navigator.of(context).pushNamed('/login');
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: SizedBox(
                width: 250,
                height: 45,
                child: ElevatedButton(
                  onPressed: () {
                    authModeProvider.setAuthMode = AuthMode.signup;
                    Navigator.of(context).pushNamed('/login');
                  },
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
            TextButton.icon(
              onPressed: () {
                Navigator.of(context).pushReplacementNamed('/home');
              },
              label: const Text("Skip sign In"),
              icon: const Icon(
                Icons.arrow_forward_ios,
                size: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
