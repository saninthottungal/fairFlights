import 'package:flutter/material.dart';

import '../../core/constants/colors.dart';

class ScreenLogin extends StatelessWidget {
  const ScreenLogin({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(width: double.infinity, height: 55),
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
                image: const DecorationImage(
                  fit: BoxFit.fitHeight,
                  image: AssetImage('assets/images/auth.jpg'),
                ),
              ),
            ),
            const Text(
              "Sign Up",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                      width: double.infinity,
                      child: Text(
                        "E-mail",
                        style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      )),
                  TextField(
                      style: TextStyle(
                        color: Colors.black,
                      ),
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.mail, color: Colors.black38),
                        contentPadding: EdgeInsets.all(15),
                        hintText: "Enter email",
                        hintStyle: TextStyle(
                          color: Colors.black26,
                          fontSize: 15,
                        ),
                        border: OutlineInputBorder(),
                      )),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                      width: double.infinity,
                      child: Text(
                        "Password",
                        style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      )),
                  TextField(
                    style: TextStyle(
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.key, color: Colors.black38),
                      contentPadding: EdgeInsets.all(15),
                      hintText: "Enter password",
                      hintStyle: TextStyle(
                        color: Colors.black26,
                        fontSize: 15,
                      ),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ],
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 30),
            //   child: SizedBox(
            //     width: double.infinity,
            //     child: Text(
            //       "Forgot Password?",
            //       textAlign: TextAlign.start,
            //     ),
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.only(right: 30),
              child: Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  style: ButtonStyle(
                      foregroundColor:
                          const MaterialStatePropertyAll(Colors.white),
                      backgroundColor:
                          MaterialStatePropertyAll(AppColor.customBlue)),
                  onPressed: () {},
                  child: Text("Create Account"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
