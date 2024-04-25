import 'package:flight_booking/core/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ScreenMailVerify extends StatefulWidget {
  const ScreenMailVerify({super.key});

  @override
  State<ScreenMailVerify> createState() => _ScreenMailVerifyState();
}

class _ScreenMailVerifyState extends State<ScreenMailVerify> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30, bottom: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //image widget
            Container(
              height: height * 0.3,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/mail.png'))),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 10),
                  child: Text(
                    'Verify your email',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      color: Colors.black.withOpacity(0.8),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "A verification mail will be sent to ceosanin564@gmail.com. please verify it. once verified, you will be redirected to home. if not,",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 16,
                      ),
                    ),
                    GestureDetector(
                      child: const Text(
                        "click here.",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CupertinoButton(
                      onPressed: () {},
                      pressedOpacity: 0.9,
                      color: AppColor.customBlue,
                      child: const Text('Resend mail in 15 seconds'),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
