import 'package:flutter/material.dart';

import 'widgets/logo_container.dart';

class ScreenPrivacyPolicy extends StatelessWidget {
  const ScreenPrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text("About Us"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 25),
        child: Column(
          children: [
            const SizedBox(width: double.infinity),
            LogoWidget(width: width),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 30),
              child: Column(
                children: [
                  Text(
                    'FairFlights',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    "Version: 1.0.0",
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
            const Text(
              "We compare all the top travel sites in one simple search and help you find the best flight deals. As a travel metasearch engine, we don't sell tickets. The booking happens in respective online travel agent websites.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
                wordSpacing: 1,
              ),
            ),
            const Card(
              margin: EdgeInsets.symmetric(vertical: 25),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.black45,
                      foregroundColor: Colors.white,
                      child: Icon(Icons.lock),
                    ),
                    SizedBox(width: 20),
                    Text(
                      "Privacy Policy",
                      style: TextStyle(fontSize: 19),
                    ),
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
