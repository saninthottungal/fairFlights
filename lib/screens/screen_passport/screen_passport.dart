import 'package:flight_booking/core/constants/enums.dart';
import 'package:flight_booking/providers/auth_state_provider/auth_state_provider.dart';
import 'package:flight_booking/screens/screen_passport/widgets/card_field.dart';
import 'package:flight_booking/screens/screen_passport/widgets/custom_button.dart';
import 'package:flight_booking/screens/screen_passport/widgets/custom_container.dart';
import 'package:flight_booking/screens/screen_passport/widgets/logo_row_widget.dart';
import 'package:flight_booking/screens/screen_passport/widgets/custom_auth_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScreenPassport extends StatelessWidget {
  const ScreenPassport({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthStateProvider>(context);

    return authProvider.userCurrentState == UserState.loggedIn
        ? SingleChildScrollView(
            child: CustomContainerWidget(
            children: [
              const LogoRowWidget(
                  imagePath: 'assets/images/passport.png',
                  title: "Passport\nAppointment 1599/Rs only"),
              const SizedBox(height: 15),
              const CardField(title: "Name", icon: Icons.person),
              const CardField(title: "Email", icon: Icons.mail),
              const CardField(title: "Mobile", icon: Icons.phone),
              const CardField(title: "Place", icon: Icons.location_city),
              const SizedBox(height: 15),
              CustomButtonWidget(
                childTitle: 'Next',
                width: 180,
                onPressed: () {},
              )
            ],
          ))
        : authProvider.userCurrentState == UserState.loggedInEmailNotVerified
            ? CustomAuthWidget(
                imagePath: 'assets/images/mail.png',
                title: 'verify email to continue',
                onpressed: () {
                  authProvider.sendEmailVerification();
                  Navigator.of(context).pushNamed('/mail');
                },
              )
            : CustomAuthWidget(
                imagePath: 'assets/images/auth_bg.png',
                title: 'please login to continue',
                onpressed: () {
                  Navigator.of(context).pushNamed('/auth');
                },
              );
  }
}
