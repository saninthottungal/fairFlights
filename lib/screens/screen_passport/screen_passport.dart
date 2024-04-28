import 'package:flight_booking/core/constants/enums.dart';
import 'package:flight_booking/providers/auth_service_provider/auth_service_provider.dart';
import 'package:flight_booking/providers/firestore_provider/firestore_provider.dart';
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
    final authProvider = Provider.of<AuthServiceProvider>(context);

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
                childTitle: 'Apply',
                width: 180,
                onPressed: () async {
                  Map<String, dynamic> data = {
                    'name': 'sanin',
                    'age': 20,
                    'mobile': 8590956006,
                  };
                  final provider = context.read<FirestoreProvider>();
                  await provider.firestoreFunctions.addDataToFirestore(
                    collectionPath: 'passports',
                    data: data,
                  );
                },
              )
            ],
          ))
        : const CustomAuthWidget();
  }
}
