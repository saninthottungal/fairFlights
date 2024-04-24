import 'package:flight_booking/providers/flight_providers/flight_data_provider.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class IsLoadingWidget extends StatelessWidget {
  const IsLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            LottieBuilder.asset(
              'assets/images/loading.json',
              height: height * 0.7,
              width: width * 0.7,
            ),
            Consumer<FlightDataProvider>(builder: (context, provider, _) {
              return Text(
                provider.loadingText,
                style: TextStyle(
                  color: Colors.black.withOpacity(0.8),
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
