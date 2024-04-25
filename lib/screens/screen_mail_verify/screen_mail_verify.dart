import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flight_booking/core/constants/colors.dart';
import 'package:flight_booking/providers/auth_state_provider/auth_state_provider.dart';
import 'package:flight_booking/providers/auth_state_provider/timer_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScreenMailVerify extends StatefulWidget {
  const ScreenMailVerify({super.key});

  @override
  State<ScreenMailVerify> createState() => _ScreenMailVerifyState();
}

class _ScreenMailVerifyState extends State<ScreenMailVerify> {
  Timer? _timer;
  bool _isEmailVerified = false;

  @override
  void initState() {
    Provider.of<TimerProvider>(context, listen: false).startTimer();

    _isEmailVerified = Provider.of<AuthStateProvider>(context, listen: false)
        .user!
        .emailVerified;
    if (!_isEmailVerified) {
      sendEmailVerification();

      _timer = Timer.periodic(const Duration(seconds: 3), (_) {
        checkEmailVerified();
      });
    }
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  sendEmailVerification() async {
    final provider = Provider.of<AuthStateProvider>(context, listen: false);
    await provider.sendEmailVerification();
  }

  checkEmailVerified() async {
    final provider = Provider.of<AuthStateProvider>(context, listen: false);
    await provider.reloadUser();
    if (_isEmailVerified) {
      _timer?.cancel();
      Navigator.of(context).pushNamedAndRemoveUntil('/home', (route) => false);
    }
    setState(() {
      _isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AuthStateProvider>(context, listen: false);
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
                    Consumer<TimerProvider>(
                        builder: (context, countProvider, _) {
                      return CupertinoButton(
                        onPressed: () {
                          if (countProvider.timerCount == 0) {
                            provider.sendEmailVerification();
                            countProvider.timer?.cancel();
                            countProvider.startTimer();
                          }
                        },
                        pressedOpacity: 0.9,
                        color: countProvider.timerCount == 0
                            ? AppColor.customBlue
                            : AppColor.customBlue.withOpacity(0.4),
                        child: const Text('Resend mail'),
                      );
                    }),
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
