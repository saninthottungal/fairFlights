import 'package:flight_booking/Screens/ScreenPassport/Widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ScreenPassport extends StatelessWidget {
  const ScreenPassport({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "assets/passport.png",
          fit: BoxFit.fitWidth,
          // width: 600,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            color: Color.fromRGBO(17, 52, 192, 0.9),
          ),
          child: Center(
            child: Container(
              height: 500,
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color.fromRGBO(238, 239, 243, 1),
                borderRadius: BorderRadius.circular(3),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Passport\nAppointment 1599/Rs only",
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const PassportInputItem(
                    label: "Name",
                    hint: "Full Name",
                  ),
                  const PassportInputItem(
                    label: "Email",
                    hint: "Enter Email",
                  ),
                  const PassportInputItem(
                    label: "Mobile",
                    hint: "Enter Mobile",
                  ),
                  const PassportInputItem(
                    label: "Place",
                    hint: "Enter Place",
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25.0, vertical: 15),
                    child: Container(
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(254, 167, 0, 1),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: Text(
                          "SUBMIT",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.white.withOpacity(0.9),
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        Positioned(
          left: 0,
          bottom: 0,
          child: Image.asset(
            'assets/whatsapp.png',
            width: 100,
          ),
        ),
      ],
    );
  }
}
