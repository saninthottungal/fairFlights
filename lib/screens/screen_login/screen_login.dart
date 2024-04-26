import 'package:flight_booking/core/constants/enums.dart';
import 'package:flight_booking/core/widgets/custom_snack_bar.dart';
import 'package:flight_booking/providers/auth_state_provider/auth_mode_provider.dart';
import 'package:flight_booking/providers/auth_state_provider/auth_state_provider.dart';
import 'package:flight_booking/providers/auth_state_provider/pass_provider.dart';
import 'package:flight_booking/screens/screen_auth/widgets/auth_image_widget.dart';
import 'package:flight_booking/screens/screen_login/widgets/custom_textfield.dart';
import 'package:flight_booking/screens/screen_passport/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScreenLogin extends StatelessWidget {
  ScreenLogin({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authMode = Provider.of<AuthModeProvider>(context).selectedMode;
    final isPassVisible = Provider.of<PassProvider>(context).isVisible;
    final authProvider = Provider.of<AuthStateProvider>(context, listen: false);
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
              CustomTextFieldWidget(
                controller: emailController,
                title: "E-Mail",
                hintText: 'Enter E-mail',
                prefixIcon: Icons.mail,
                obscure: false,
              ),
              CustomTextFieldWidget(
                controller: passwordController,
                title: "Password",
                hintText: 'Enter Password',
                prefixIcon: Icons.key,
                obscure: !isPassVisible,
                suffixIcon: IconButton(
                  onPressed: () {
                    Provider.of<PassProvider>(context, listen: false)
                        .changeIsVisible();
                  },
                  icon: Icon(
                    isPassVisible
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                  ),
                ),
              ),
              authMode == AuthMode.signin
                  ? Align(
                      alignment: Alignment.topLeft,
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed('/reset');
                        },
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
                  onPressed: () async {
                    final navigator = Navigator.of(context);

                    String email = '';
                    String password = '';
                    if (emailController.text.trim().isNotEmpty &&
                        passwordController.text.trim().isNotEmpty) {
                      email = emailController.text;
                      password = passwordController.text;
                    } else {
                      return;
                      //errors
                    }
                    if (authMode == AuthMode.signin) {
                      final message = await authProvider.signIn(
                          email: email, password: password);
                      if (message != null) {
                        CustomSnackbar.show(context: context, message: message);
                        return;
                      }
                    } else {
                      await authProvider.signUp(
                          email: email, password: password);
                    }

                    //navigating to mail verification
                    //if condition required to check if already mail verified
                    if (authProvider.userCurrentState == UserState.loggedIn) {
                      navigator.pushReplacementNamed('/home');
                    } else {
                      navigator.pushNamed('/mail');
                      await authProvider.sendEmailVerification();
                    }
                  },
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
