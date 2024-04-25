import 'package:flight_booking/core/constants/enums.dart';
import 'package:flight_booking/screens/screen_passport/widgets/card_field.dart';
import 'package:flight_booking/screens/screen_passport/widgets/custom_button.dart';
import 'package:flight_booking/screens/screen_passport/widgets/custom_container.dart';
import 'package:flight_booking/screens/screen_passport/widgets/logo_row_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/auth_provider/auth_provider.dart';

class ScreenVisa extends StatelessWidget {
  const ScreenVisa({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return authProvider.userCurrentState == UserState.loggedIn
        ? SingleChildScrollView(
            child: CustomContainerWidget(
              children: [
                const LogoRowWidget(
                    imagePath: 'assets/images/visa.png', title: 'Tourist Visa'),
                const CardField(title: 'Name', icon: Icons.person),
                const CardField(title: "Email", icon: Icons.mail),
                const CardField(title: "Mobile", icon: Icons.phone),
                const CardField(title: "Place", icon: Icons.location_city),
                const SizedBox(height: 15),
                CustomButtonWidget(
                  childTitle: 'Apply',
                  width: 180,
                  onPressed: () {},
                )
              ],
            ),
          )
        : authProvider.userCurrentState == UserState.loggedInEmailNotVerified
            ? const Center(
                child: Text("Please verify your email"),
              )
            : const Center(
                child: Text("Please login to continue"),
              );
  }
}
