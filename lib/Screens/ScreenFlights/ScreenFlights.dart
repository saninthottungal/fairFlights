import 'dart:convert';
import 'dart:developer';

import 'package:flight_booking/Providers/FlightProviders/FlightDataProvider.dart';
import 'package:flight_booking/Screens/ScreenFlights/Widgets/AppBar.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class ScreenFlights extends StatelessWidget {
  const ScreenFlights({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final provider = Provider.of<FlightDataProvider>(context, listen: false);

      final list = await provider.getFlightData(context);
      final proposals = list.first['proposals'];
      log(proposals.toString());
    });
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Consumer<FlightDataProvider>(builder: (context, flightProvider, _) {
      return flightProvider.isLoading
          ? Scaffold(
              body: Center(
                child: Column(
                  children: [
                    LottieBuilder.asset(
                      'assets/loading.json',
                      height: height * 0.7,
                      width: width * 0.7,
                    ),
                    Text(
                      "Finding best Flights for you...",
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.8),
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            )
          : Scaffold(
              appBar: CustomAppBar(
                onPressed: () async {
                  showModalBottomSheet(
                      context: context,
                      builder: (ctx) {
                        return SizedBox(
                          height: height * 0.5,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Text("Sort"),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text("Cheapest First"),
                                  Radio(
                                      value: true,
                                      groupValue: true,
                                      onChanged: (value) {})
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text("Trip Duration"),
                                  Radio(
                                      value: true,
                                      groupValue: true,
                                      onChanged: (value) {})
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text("Rating"),
                                  Radio(
                                      value: true,
                                      groupValue: true,
                                      onChanged: (value) {})
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text("Departure Time"),
                                  Radio(
                                      value: true,
                                      groupValue: true,
                                      onChanged: (value) {})
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text("Arrival Time"),
                                  Radio(
                                      value: true,
                                      groupValue: true,
                                      onChanged: (value) {})
                                ],
                              ),
                            ],
                          ),
                        );
                      });
                },
              ),
              body: SafeArea(
                child: Column(
                  children: [
                    Flexible(
                      flex: 1,
                      child: Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 10, top: 10),
                            child: RotatedBox(
                              quarterTurns: 3,
                              child: Text(
                                "MAR",
                              ),
                            ),
                          ),
                          const VerticalDivider(width: 20, indent: 10),
                          Expanded(
                            flex: 1,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              //shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10, left: 5, right: 5, bottom: 5),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: index == 1
                                          ? const BorderDirectional(
                                              bottom: BorderSide(
                                              color: Colors.blue,
                                              width: 3,
                                            ))
                                          : const Border(),
                                    ),
                                    width: 65,
                                    child: Column(
                                      children: [
                                        Text("Thu, $index"),
                                        Text(
                                          "\$48569",
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: index == 1
                                                  ? Colors.lightBlue
                                                  : Colors.black),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                              itemCount: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Divider(),
                    Flexible(
                      flex: 10,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: ListView.separated(
                          itemBuilder: (context, index) {
                            return const SizedBox(
                              height: 100,
                              width: double.infinity,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  SizedBox(
                                    width: double.infinity,
                                    child: Text(
                                      "Air India, United Airlines",
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      CircleAvatar(),
                                      Column(
                                        children: [
                                          Text(
                                            "07:15",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18),
                                          ),
                                          Text("DEL"),
                                        ],
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Text("24h 50m"),
                                          Divider(),
                                          Text("1 stop"),
                                        ],
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Text(
                                            "07:15",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18),
                                          ),
                                          Text("DEL"),
                                        ],
                                      ),
                                      SizedBox(width: 15),
                                      Padding(
                                        padding: EdgeInsets.only(bottom: 15),
                                        child: Text(
                                          "\$82705",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return const Divider();
                          },
                          itemCount: 10,
                        ),
                      ),
                    ),
                  ],
                ),
              ));
    });
  }
}


// //   WidgetsBinding.instance!.addPostFrameCallback((_) {
//       // This function will be executed after the build method has completed
//       print('Build method completed');
//       // Perform your desired action here
//     });