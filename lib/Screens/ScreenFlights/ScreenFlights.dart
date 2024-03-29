import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flight_booking/Screens/ScreenFlights/Widgets/AppBar.dart';
import 'package:flight_booking/Models/FlightSearchPostModel/flightSignature.dart';
import 'package:flight_booking/Models/FlightSearchPostModel/FlightSearchPostModel.dart';
import 'package:flight_booking/Models/FlightSearchPostModel/passengers.dart';
import 'package:flight_booking/Models/FlightSearchPostModel/segment.dart';
import 'package:flight_booking/Services/Connectivty/CheckConnectivty.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ScreenFlights extends StatelessWidget {
  const ScreenFlights({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: CustomAppBar(
          onPressed: () async {
            //here to here
            final marker = dotenv.env['API_MARKER'];
            const host = 'FairFlights';
            final userIp = await CheckNetConnectivity().getIpAddress();
            const locale = 'en';
            const tripClass = 'Y';
            final passengers = Passengers(
              adults: 1,
              children: 0,
              infants: 0,
            );
            final List<Segment?> segments = [
              Segment(origin: 'DXB', destination: 'COK', date: '2024-03-29'),
              Segment(origin: 'COK', destination: 'DXB', date: '2024-04-29'),
            ];
            const currency = 'INR';

            final flightPostModel = FlightSearchPostModel(
              marker: marker,
              host: host,
              userIp: userIp,
              locale: locale,
              tripClass: tripClass,
              passengers: passengers,
              segments: segments,
              currency: currency,
            );

            final signature = await getSignatureFromFlightPostData(
                flightData: flightPostModel);
            //print(signature);

            const baseUrl = 'http://api.travelpayouts.com/v1/flight_search';
            flightPostModel.signature = signature;
            final result = flightPostModel.toJson();
            print(result);

            final dioPost = Dio();

            late String uuid;
            bool isFound = false;
            Response response;
            try {
              final response = await dioPost.post(baseUrl, data: result);
              uuid = response.data['search_id'];
              print(uuid);
            } catch (_) {
              print("error");
            }
            final dioGet = Dio();
            final List data = [];

            const resultBaseUrl =
                'http://api.travelpayouts.com/v1/flight_search_results';

            while (!isFound) {
              response = await dioGet.get(
                resultBaseUrl,
                queryParameters: {'uuid': uuid},
              );

              if (response.data is List) {
                final dataList = response.data as List;
                data.addAll(dataList);
                log(data.toString());

                final lastElement = dataList.last as Map<String, dynamic>;
                if (lastElement.length == 1) {
                  print("printing lastelement");
                  print(lastElement);

                  if (lastElement.containsKey('search_id')) {
                    print("found search_id");
                    isFound = true;
                  }
                }
              }
            }

            //here to here

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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Cheapest First"),
                            Radio(
                                value: true,
                                groupValue: true,
                                onChanged: (value) {})
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Trip Duration"),
                            Radio(
                                value: true,
                                groupValue: true,
                                onChanged: (value) {})
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Rating"),
                            Radio(
                                value: true,
                                groupValue: true,
                                onChanged: (value) {})
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Departure Time"),
                            Radio(
                                value: true,
                                groupValue: true,
                                onChanged: (value) {})
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Arrival Time"),
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
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                              width: double.infinity,
                              child: Text(
                                "Air India, United Airlines",
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
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
  }
}
