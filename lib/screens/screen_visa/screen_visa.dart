import 'package:flight_booking/screens/screen_passport/widgets/card_field.dart';
import 'package:flight_booking/screens/screen_passport/widgets/custom_button.dart';
import 'package:flight_booking/screens/screen_passport/widgets/custom_container.dart';
import 'package:flight_booking/screens/screen_passport/widgets/logo_row_widget.dart';
import 'package:flutter/material.dart';

class ScreenVisa extends StatelessWidget {
  const ScreenVisa({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: CustomContainerWidget(
        children: [
          const LogoRowWidget(
              imagePath: 'assets/images/visa.png', title: 'Tourist Visa'),
          const CardField(title: 'Name', icon: Icons.person),
          const CardField(title: "Email", icon: Icons.mail),
          const CardField(title: "Mobile", icon: Icons.phone),
          const CardField(title: "Place", icon: Icons.location_city),
          const SizedBox(height: 15),
          CustomButtonWidget(childTitle: 'Apply', onPressed: () {})
        ],
      ),
    );
  }
}
