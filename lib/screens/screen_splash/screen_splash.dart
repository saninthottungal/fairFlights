import 'package:flight_booking/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScreenSplash extends StatefulWidget {
  const ScreenSplash({super.key});

  @override
  State<ScreenSplash> createState() => _ScreenSplashState();
}

class _ScreenSplashState extends State<ScreenSplash> {
  @override
  void initState() {
    checkUserState(context);
    super.initState();
  }

  void checkUserState(BuildContext context) async {
    Future.delayed(const Duration(seconds: 1), () async {
      SharedPreferences sharedpref = await SharedPreferences.getInstance();
      final isFirstTime = sharedpref.getBool('isFirst') ?? true;
      if (isFirstTime) {
        if (!context.mounted) return;
        Navigator.of(context).pushReplacementNamed('/auth');
        sharedpref.setBool('isFirst', false);
      } else {
        if (!context.mounted) return;
        Navigator.of(context).pushReplacementNamed('/home');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.customBlue,
      body: const Center(
        child: Text(
          "LOGO",
          style: TextStyle(
            fontSize: 60,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
