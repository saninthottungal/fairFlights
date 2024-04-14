import 'package:flight_booking/Screens/ScreenFlight/Widgets/SegmentWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScreenFlight extends StatelessWidget {
  const ScreenFlight({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 238, 240, 242),
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    "5000",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const ListTile(
                title: Row(
                  children: [
                    Text(
                      "Las Vegas",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      " - ",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Kochi",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                subtitle: Text(
                  "Travel time : 31h 31m",
                  style: TextStyle(fontSize: 16, color: Colors.black54),
                ),
              ),
              const Card(
                margin: EdgeInsets.symmetric(horizontal: 12),
                color: Colors.white,
                child: Column(
                  children: [
                    SegmentWidget(),
                    SegmentWidget(),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: SizedBox(
                  width: width * 0.95,
                  child: CupertinoButton(
                      color: Colors.green,
                      child: const Text("Buy for 520"),
                      onPressed: () {}),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
