import 'package:flight_booking/core/constants/colors.dart';
import 'package:flight_booking/core/widgets/custom_utilities.dart';
import 'package:flight_booking/providers/firestore_provider/firestore_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import 'widgets/support_container.dart';

class ScreenSupport extends StatelessWidget {
  const ScreenSupport({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, bottom: 15),
      child: Column(
        children: [
          Expanded(
            flex: 5,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: const [
                SizedBox(width: 12),
                SupportContainerWidget(
                  bgColor: Color.fromARGB(255, 8, 6, 100),
                  imagePath: 'assets/images/visaimage.png',
                  title: 'Visa Booking',
                  titleIcon: Icons.badge_outlined,
                ),
                SupportContainerWidget(
                  bgColor: Color.fromRGBO(103, 15, 76, 1),
                  imagePath: 'assets/images/flightbookimage.png',
                  title: 'Flight Booking',
                  titleIcon: Icons.airplane_ticket_outlined,
                ),
                SupportContainerWidget(
                  bgColor: Color.fromARGB(255, 0, 87, 91),
                  imagePath: 'assets/images/passportimage.png',
                  title: 'Passport Appoinment',
                  titleIcon: Icons.assignment_outlined,
                ),
              ],
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
              margin: const EdgeInsets.only(right: 22, top: 20, left: 22),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
              ),
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text(
                    "Simplify Your Travel Plans",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const Text(
                    "Skip the hassle of online paper work. Let us handle your ticketing, passport and visa needs.",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  ElevatedButton.icon(
                    style: ButtonStyle(
                        foregroundColor:
                            const MaterialStatePropertyAll(Colors.white),
                        backgroundColor:
                            MaterialStatePropertyAll(AppColor.customBlue)),
                    onPressed: () async {
                      final provider = context.read<FirestoreProvider>();

                      CustomUtilities.showBlankDialogue(context);
                      final message = await provider.getWhatsappInfo();
                      if (!context.mounted) return;
                      Navigator.pop(context);
                      if (message != null) {
                        if (!context.mounted) return;
                        CustomUtilities.showSnackBar(
                          context: context,
                          message: message,
                        );
                        return;
                      }
                      final mapValue =
                          context.read<FirestoreProvider>().whatsappInfo;
                      final number = mapValue?.entries.first.value as String?;
                      final url = Uri.parse('https://wa.me/$number');
                      if (number != null) {
                        if (!await launchUrl(url)) {
                          if (!context.mounted) return;
                          CustomUtilities.showSnackBar(
                            context: context,
                            message: "Couldn't launch external browser.",
                          );
                        }
                      } else {
                        if (!context.mounted) return;
                        CustomUtilities.showSnackBar(
                          context: context,
                          message: "Couldn't fetch contact details.",
                        );
                      }
                    },
                    label: const Text("Contact Us"),
                    icon: const Icon(Icons.call),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
