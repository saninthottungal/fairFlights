import 'package:flutter/material.dart';

class PrivacyCardWidget extends StatelessWidget {
  const PrivacyCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Card(
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
    );
  }
}
