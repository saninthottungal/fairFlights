import 'package:flight_booking/core/constants/colors.dart';
import 'package:flight_booking/core/constants/enums.dart';
import 'package:flight_booking/providers/auth_state_provider/auth_state_provider.dart';
import 'package:flight_booking/providers/auth_state_provider/timer_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScreenMailVerify extends StatelessWidget {
  const ScreenMailVerify({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthStateProvider>(context, listen: false);
    Provider.of<TimerProvider>(context, listen: false).startTimer();

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
                    Text(
                      "A verification mail will be sent to ${authProvider.userMail ?? 'your mail'}. please verify it and then click continue. didn't get the mail?",
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                        color: Colors.black54,
                        fontSize: 16,
                      ),
                    ),
                    Consumer<TimerProvider>(
                        builder: (context, timerProvider, _) {
                      return GestureDetector(
                        onTap: () async {
                          if (timerProvider.timerCount == 0) {
                            timerProvider.startTimer();
                            await authProvider.sendEmailVerification();
                          }
                        },
                        child: Text(
                          timerProvider.timerCount == 0
                              ? "resend mail."
                              : "resend mail in ${timerProvider.timerCount}.",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: timerProvider.timerCount == 0
                                ? Colors.blue
                                : Colors.black,
                            fontSize: 16,
                          ),
                        ),
                      );
                    }),
                  ],
                ),
                const SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CupertinoButton(
                      onPressed: () async {
                        final navigator = Navigator.of(context);
                        await authProvider.reloadUser();
                        if (authProvider.userCurrentState ==
                            UserState.loggedIn) {
                          navigator.pushNamedAndRemoveUntil(
                              '/home', (route) => false);
                        }
                      },
                      pressedOpacity: 0.9,
                      color: AppColor.customBlue,
                      child: const Text('Continue'),
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
