import 'package:flight_booking/core/constants/colors.dart';
import 'package:flutter/material.dart';

import 'widgets/support_container.dart';

class ScreenSupport extends StatelessWidget {
  const ScreenSupport({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 238, 240, 242),
      body: Padding(
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
                    imagePath: 'assets/visaimage.png',
                    title: 'Visa Booking',
                    titleIcon: Icons.badge_outlined,
                  ),
                  SupportContainerWidget(
                    bgColor: Color.fromARGB(255, 103, 15, 76),
                    imagePath: 'assets/flightbookimage.png',
                    title: 'Flight Booking',
                    titleIcon: Icons.airplane_ticket_outlined,
                  ),
                  SupportContainerWidget(
                    bgColor: Color.fromARGB(255, 0, 87, 91),
                    imagePath: 'assets/passportimage.png',
                    title: 'Passport Appoinment',
                    titleIcon: Icons.assignment_outlined,
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 4,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
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
                      onPressed: () {},
                      label: const Text("Contact Us"),
                      icon: const Icon(Icons.call),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
