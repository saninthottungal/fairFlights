import 'package:flight_booking/core/constants/enums.dart';
import 'package:flight_booking/providers/auth_provider/auth_mode_provider.dart';
import 'package:flight_booking/screens/screen_auth/widgets/auth_image_widget.dart';
import 'package:flight_booking/screens/screen_login/widgets/custom_textfield.dart';
import 'package:flight_booking/screens/screen_passport/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScreenLogin extends StatelessWidget {
  const ScreenLogin({super.key});

  @override
  Widget build(BuildContext context) {
    final authMode =
        Provider.of<AuthModeProvider>(context, listen: false).selectedMode;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const SizedBox(height: 50),
              const AuthImageWidget(),
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 10),
                child: Text(
                  authMode == AuthMode.signin ? "Sign In" : 'Sign Up',
                  style: const TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const CustomTextFieldWidget(
                title: "E-Mail",
                hintText: 'Enter E-mail',
                prefixIcon: Icons.mail,
              ),
              const CustomTextFieldWidget(
                title: "Password",
                hintText: 'Enter Password',
                prefixIcon: Icons.key,
              ),
              authMode == AuthMode.signin
                  ? Align(
                      alignment: Alignment.topLeft,
                      child: TextButton(
                        onPressed: () {},
                        child: const Text("Forgot Password?"),
                      ),
                    )
                  : const SizedBox(height: 20),
              Align(
                alignment: Alignment.topRight,
                child: CustomButtonWidget(
                  childTitle: authMode == AuthMode.signin
                      ? 'Sign In'
                      : 'Create Account',
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
