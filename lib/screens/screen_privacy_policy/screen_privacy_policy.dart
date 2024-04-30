import 'package:flight_booking/core/widgets/custom_utilities.dart';
import 'package:flight_booking/providers/firestore_provider/firestore_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import 'widgets/logo_container.dart';
import 'widgets/privacy_card.dart';

class ScreenPrivacyPolicy extends StatelessWidget {
  const ScreenPrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text("About Us"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 25),
        child: Column(
          children: [
            const SizedBox(width: double.infinity),
            LogoWidget(width: width),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 30),
              child: Column(
                children: [
                  Text(
                    'FairFlights',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    "Version: 1.0.0",
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
            const Text(
              "We compare all the top travel sites in one simple search and help you find the best flight deals. As a travel metasearch engine, we don't sell tickets. The booking happens in respective online travel agent websites.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
                wordSpacing: 1,
              ),
            ),
            GestureDetector(
              onTap: () async {
                final provider = context.read<FirestoreProvider>();
                CustomUtilities.showBlankDialogue(context);
                final message = await provider.getPrivacyPolicyLink();
                if (!context.mounted) return;
                Navigator.of(context).pop();
                if (message != null) {
                  if (!context.mounted) return;
                  CustomUtilities.showSnackBar(
                      context: context, message: message);
                  return;
                }
                final linkAsMap =
                    context.read<FirestoreProvider>().privacyPolicyLink;
                final link = linkAsMap?.entries.first.value as String?;
                if (link != null) {
                  final url = Uri.parse(link);
                  if (!await launchUrl(url)) {
                    if (!context.mounted) return;
                    CustomUtilities.showSnackBar(
                        context: context,
                        message: "Couldn't load privacy policy");
                  }
                } else {
                  if (!context.mounted) return;
                  CustomUtilities.showSnackBar(
                      context: context,
                      message:
                          "privacy policy components not availble at the moment.");
                }
              },
              child: const PrivacyCardWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
