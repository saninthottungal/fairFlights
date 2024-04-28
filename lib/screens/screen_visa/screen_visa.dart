import 'package:flight_booking/core/constants/enums.dart';
import 'package:flight_booking/screens/screen_passport/widgets/card_field.dart';
import 'package:flight_booking/screens/screen_passport/widgets/custom_button.dart';
import 'package:flight_booking/screens/screen_passport/widgets/custom_container.dart';
import 'package:flight_booking/screens/screen_passport/widgets/logo_row_widget.dart';
import 'package:flight_booking/screens/screen_passport/widgets/custom_auth_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/auth_service_provider/auth_service_provider.dart';

class ScreenVisa extends StatelessWidget {
  ScreenVisa({super.key});

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final placeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthServiceProvider>(context);
    return authProvider.userCurrentState == UserState.loggedIn
        ? SingleChildScrollView(
            child: CustomContainerWidget(
              children: [
                const LogoRowWidget(
                    imagePath: 'assets/images/visa.png', title: 'Tourist Visa'),
                CardField(
                  title: 'Name',
                  icon: Icons.person,
                  controller: nameController,
                ),
                CardField(
                  title: "Email",
                  icon: Icons.mail,
                  controller: emailController,
                ),
                CardField(
                  title: "Mobile",
                  icon: Icons.phone,
                  controller: phoneController,
                  keyboardType: TextInputType.number,
                ),
                CardField(
                  title: "Place",
                  icon: Icons.location_city,
                  controller: placeController,
                ),
                const SizedBox(height: 15),
                CustomButtonWidget(
                  childTitle: 'Apply',
                  width: 180,
                  onPressed: () {},
                )
              ],
            ),
          )
        : const CustomAuthWidget();
  }
}
