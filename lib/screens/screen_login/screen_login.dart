import 'package:flight_booking/screens/screen_auth/widgets/auth_image_widget.dart';
import 'package:flight_booking/screens/screen_login/widgets/custom_textfield.dart';
import 'package:flight_booking/screens/screen_passport/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class ScreenLogin extends StatelessWidget {
  const ScreenLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const SizedBox(height: 50),
              const AuthImageWidget(),
              const Padding(
                padding: EdgeInsets.only(top: 20, bottom: 10),
                child: Text(
                  "Sign Up",
                  style: TextStyle(
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
              Align(
                alignment: Alignment.topLeft,
                child: TextButton(
                  onPressed: () {},
                  child: const Text("Forgot Password?"),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: CustomButtonWidget(
                  childTitle: 'Create Account',
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
