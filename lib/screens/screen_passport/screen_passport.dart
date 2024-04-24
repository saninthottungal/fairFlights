import 'package:flight_booking/core/constants/colors.dart';
import 'package:flight_booking/screens/screen_passport/widgets/card_field.dart';
import 'package:flutter/material.dart';

class ScreenPassport extends StatelessWidget {
  const ScreenPassport({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 18),
        child: Card(
          elevation: 5,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white70,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 10),
              child: Column(children: [
                Wrap(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/images/passport.png',
                      height: 55,
                      width: 55,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      "Passport\nAppointment 1599/Rs only",
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.8),
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 35),
                const CardField(title: "Name", icon: Icons.person),
                const SizedBox(height: 15),
                const CardField(title: "Email", icon: Icons.mail),
                const SizedBox(height: 15),
                const CardField(title: "Mobile", icon: Icons.phone),
                const SizedBox(height: 15),
                const CardField(title: "Place", icon: Icons.location_city),
                const SizedBox(height: 30),
                SizedBox(
                  width: 180,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(AppColor.customBlue),
                    ),
                    child: const Text(
                      "Next",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
