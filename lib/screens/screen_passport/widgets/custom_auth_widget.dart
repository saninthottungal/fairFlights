import 'package:flight_booking/core/constants/enums.dart';
import 'package:flight_booking/providers/auth_state_provider/auth_state_provider.dart';
import 'package:flight_booking/screens/screen_passport/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomAuthWidget extends StatelessWidget {
  const CustomAuthWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Consumer<AuthStateProvider>(builder: (context, provider, _) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 25),
            height: height * 0.2,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    provider.userCurrentState == UserState.loggedOut
                        ? 'assets/images/auth_bg.png'
                        : 'assets/images/mail.png'),
              ),
            ),
          ),
          CustomButtonWidget(
            childTitle: provider.userCurrentState == UserState.loggedOut
                ? 'Please login to continue'
                : 'verify email to continue',
            onPressed: () {
              if (provider.userCurrentState == UserState.loggedOut) {
                Navigator.of(context).pushNamed('/auth');
              } else {
                provider.sendEmailVerification();
                Navigator.of(context).pushNamed('/mail');
              }
            },
          )
        ],
      );
    });
  }
}
