import 'package:flight_booking/core/constants/enums.dart';
import 'package:flight_booking/core/widgets/custom_utilities.dart';
import 'package:flight_booking/providers/firestore_provider/firestore_provider.dart';
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

  @override
  Widget build(BuildContext context) {
    final firstoreProvider = context.watch<FirestoreProvider>();
    final authProvider = Provider.of<AuthServiceProvider>(context);
    return authProvider.userCurrentState == UserState.loggedIn
        ? SingleChildScrollView(
            child: CustomContainerWidget(
              children: [
                const LogoRowWidget(
                  imagePath: 'assets/images/visa.png',
                  title: 'Tourist Visa',
                ),
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
                const SizedBox(height: 10),
                const SizedBox(
                    width: double.infinity,
                    child: Text(
                      "Country",
                      style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    )),
                Card(
                  child: ListTile(
                    leading: const Icon(
                      Icons.location_city,
                      color: Colors.black38,
                    ),
                    title: Text(
                      firstoreProvider.selectedCountry ?? "Select Country",
                      style: firstoreProvider.selectedCountry == null
                          ? const TextStyle(
                              color: Colors.black26,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            )
                          : null,
                    ),
                    titleAlignment: ListTileTitleAlignment.center,
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.black38,
                    ),
                    onTap: () async {
                      final provider = context.read<FirestoreProvider>();

                      if (provider.countries.isEmpty) {
                        CustomUtilities.showBlankDialogue(context);
                        final message = await provider.getCountryData();
                        if (!context.mounted) return;
                        Navigator.of(context).pop();
                        if (message != null) {
                          if (!context.mounted) return;
                          CustomUtilities.showSnackBar(
                              context: context, message: message);
                          return;
                        }
                      }
                      provider.setSearchCountries();
                      if (!context.mounted) return;
                      Navigator.of(context).pushNamed('/country');
                    },
                  ),
                ),
                const SizedBox(height: 25),
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
                      collectionPath: 'visas',
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
            ),
          )
        : const CustomAuthWidget();
  }

  Map<String, dynamic>? getdata(BuildContext context) {
    final provider = context.read<FirestoreProvider>();
    String name = nameController.text;
    String mail = emailController.text;
    String phone = phoneController.text;
    String? country = provider.selectedCountry;
    String? user = context.read<AuthServiceProvider>().userMail;

    if (name.isEmpty) return null;
    if (mail.isEmpty) return null;
    if (phone.isEmpty) return null;
    if (country == null) return null;
    if (user == null) return null;

    provider.setCountry = null;

    return {
      'name': name,
      'mail': mail,
      'phone': phone,
      'country': country,
      'user': user,
    };
  }
}
