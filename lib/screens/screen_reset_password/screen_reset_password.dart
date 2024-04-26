import 'package:flight_booking/core/constants/colors.dart';
import 'package:flight_booking/core/widgets/custom_utilities.dart';
import 'package:flight_booking/providers/auth_state_provider/auth_state_provider.dart';
import 'package:flight_booking/screens/screen_login/widgets/custom_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScreenRestPassword extends StatelessWidget {
  ScreenRestPassword({super.key});
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final authProvider = Provider.of<AuthStateProvider>(context, listen: false);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30, bottom: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: height * 0.15),
              //image widget
              Container(
                height: height * 0.3,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/mail.png'))),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 10),
                    child: Text(
                      'Reset your password',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                        color: Colors.black.withOpacity(0.8),
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "An email for password reset will be to given email. please follow the instructions in the mail.",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 16,
                        ),
                      ),
                      CustomTextFieldWidget(
                        hintText: 'Enter your mail',
                        prefixIcon: Icons.mail,
                        title: 'Mail',
                        controller: emailController,
                        obscure: false,
                      )
                    ],
                  ),
                  const SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CupertinoButton(
                        onPressed: () async {
                          String email = '';

                          if (emailController.text.trim().isNotEmpty) {
                            email = emailController.text;
                          } else {
                            CustomUtilities.showSnackBar(
                                context: context,
                                message: "email cannot be empty");
                            return;
                          }
                          CustomUtilities.showBlankDialogue(context);
                          final message =
                              await authProvider.resetPassword(email: email);
                          if (context.mounted) Navigator.pop(context);
                          if (message != null) {
                            if (context.mounted) {
                              CustomUtilities.showSnackBar(
                                  context: context, message: message);
                            }
                            return;
                          }
                          if (context.mounted) {
                            CustomUtilities.showSnackBar(
                                context: context,
                                message:
                                    "Password reset request is sent to $email.");
                          }
                          if (context.mounted) Navigator.of(context).pop();
                        },
                        pressedOpacity: 0.9,
                        color: AppColor.customBlue,
                        child: const Text('Send mail'),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
