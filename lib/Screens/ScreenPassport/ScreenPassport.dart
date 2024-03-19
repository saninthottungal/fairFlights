import 'package:flight_booking/Core/Constants/colors.dart';
import 'package:flight_booking/Screens/ScreenPassport/Widgets/CardField.dart';
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
              color: Colors.white60,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 10),
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.book_sharp,
                      size: 40,
                      color: Colors.black.withOpacity(0.8),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      "Passport\nAppointment 1599/Rs only",
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.8),
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 35),
                const CardField(title: "Name"),
                const SizedBox(height: 15),
                const CardField(title: "Email"),
                const SizedBox(height: 15),
                const CardField(title: "Mobile"),
                const SizedBox(height: 15),
                const CardField(title: "Place"),
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
