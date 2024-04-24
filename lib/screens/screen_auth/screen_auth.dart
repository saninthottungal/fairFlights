import 'package:flutter/material.dart';

import '../../core/constants/colors.dart';

class ScreenAuth extends StatelessWidget {
  const ScreenAuth({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(width: double.infinity, height: 55),
          Container(
            height: height * 0.4,
            width: width * 0.7,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.blue,
                width: 5,
                strokeAlign: BorderSide.strokeAlignOutside,
              ),
              image: DecorationImage(
                fit: BoxFit.fitHeight,
                image: AssetImage('assets/images/auth.jpg'),
              ),
            ),
          ),
          Text(
            "Hello",
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "Welcome to fairflights\nwhere you can book flights tickets",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black54,
              fontSize: 16,
            ),
          ),
          SizedBox(height: 25),
          SizedBox(
            width: 250,
            height: 45,
            child: ElevatedButton(
              style: ButtonStyle(
                  foregroundColor: const MaterialStatePropertyAll(Colors.white),
                  backgroundColor:
                      MaterialStatePropertyAll(AppColor.customBlue)),
              onPressed: () {
                Navigator.of(context).pushNamed('/login');
              },
              child: Text("Login"),
            ),
          ),
          SizedBox(height: 10),
          SizedBox(
            width: 250,
            height: 45,
            child: ElevatedButton(onPressed: () {}, child: Text("Sign Up")),
          ),
          SizedBox(height: 35),
          Text(
            "or",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black54,
              fontSize: 16,
            ),
          ),
          SizedBox(height: 10),
          Image.asset(
            'assets/images/google.png',
            height: 50,
            width: 50,
          ),
        ],
      ),
    );
  }
}
