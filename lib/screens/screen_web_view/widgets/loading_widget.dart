import 'package:flight_booking/providers/agency_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AspectRatio(
          aspectRatio: 1,
          child: Container(
            margin: const EdgeInsets.all(50),
            padding: const EdgeInsets.only(top: 60, left: 20, right: 20),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  "We're taking you to your ticket",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 5),
                Text(
                  Provider.of<AgencyProvider>(context).airline,
                  style: const TextStyle(fontSize: 15),
                ),
                const SizedBox(height: 10),
                Text(
                  Provider.of<AgencyProvider>(context).price,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 63, 77, 236),
                  ),
                ),
                const SizedBox(height: 15),
                const CircularProgressIndicator(
                  strokeWidth: 2,
                ),
              ],
            ),
          ),
        ),
        const Text("Please check the price and details before booking.")
      ],
    );
  }
}
