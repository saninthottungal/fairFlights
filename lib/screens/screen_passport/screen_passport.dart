import 'package:flight_booking/core/constants/enums.dart';
import 'package:flight_booking/core/widgets/custom_utilities.dart';
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
  ScreenPassport({super.key});

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
                  imagePath: 'assets/images/passport.png',
                  title: "Passport\nAppointment 1599/Rs only"),
              const SizedBox(height: 15),
              //name field
              CardField(
                title: "Name",
                icon: Icons.person,
                controller: nameController,
              ),
              //email field
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
                onPressed: () async {
                  final data = getdata(context);
                  if (data == null) {
                    CustomUtilities.showSnackBar(
                        context: context, message: "Fields cannot be empty.");
                    return;
                  }
                  final provider = context.read<FirestoreProvider>();
                  CustomUtilities.showBlankDialogue(context);
                  final message = await provider.addDataToFirestore(
                    collectionPath: 'passports',
                    data: data,
                  );

                  if (context.mounted) Navigator.of(context).pop();
                  if (message != null) {
                    if (!context.mounted) return;
                    CustomUtilities.showSnackBar(
                        context: context, message: message);
                    return;
                  }
                  nameController.clear();
                  emailController.clear();
                  phoneController.clear();
                  placeController.clear();
                  if (!context.mounted) return;
                  CustomUtilities.showSnackBar(
                    context: context,
                    message:
                        "Your application has been sumbitted successfully.",
                    isGreen: true,
                  );
                },
              )
            ],
          ))
        : const CustomAuthWidget();
  }

  Map<String, dynamic>? getdata(BuildContext context) {
    String name = nameController.text;
    String mail = emailController.text;
    String phone = phoneController.text;
    String place = placeController.text;
    String? user = context.read<AuthServiceProvider>().userMail;

    if (name.isEmpty) return null;
    if (mail.isEmpty) return null;
    if (phone.isEmpty) return null;
    if (place.isEmpty) return null;
    if (user == null) return null;

    return {
      'name': name,
      'mail': mail,
      'phone': phone,
      'place': place,
      'user': user,
    };
  }
}
