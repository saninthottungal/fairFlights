import 'package:flight_booking/Core/Constants/colors.dart';
import 'package:flight_booking/Providers/FlightProviders/FlightDataProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FlightsListWidget extends StatelessWidget {
  const FlightsListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 10,
      child: Padding(
        padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
        child: Consumer<FlightDataProvider>(builder: (context, provider, _) {
          return ListView.separated(
            itemBuilder: (context, index) {
              final flightData = provider.flightDatas[index];
              final flights = flightData.segment?.first.flight;
              final arrivalTime =
                  flightData.segment?.first.flight?.first.departureTime;
              final landTime =
                  flightData.segment?.first.flight?.last.arrivalTime;
              final duration =
                  ((flightData.totalDuration)! / 60).toStringAsFixed(1);
              final layoverTime = flightData.segmentDurations?.first;
              String? maxStops;

              if (flightData.isDirect != null) {
                maxStops = !flightData.isDirect!
                    ? '${flightData.maxStops} layovers'
                    : 'Direct';
              }
              return Card(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            //price

                            Text(
                              '\u20B9${provider.flightDatas[index].terms?.cost?.unifiedPrice}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: AppColor.customBlue,
                                fontSize: 20,
                              ),
                            ),

                            //logo

                            CircleAvatar(
                              backgroundColor: Colors.transparent,
                              backgroundImage: NetworkImage(
                                "http://pics.avs.io/250/250/${flights?.first.operatedBy ?? flights?.first.operatingCarrier}.png",
                                scale: 1,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  children: [
                                    //arrival time
                                    Text(
                                      arrivalTime ?? "",
                                      style: const TextStyle(fontSize: 16),
                                    ),
                                    //departure place
                                    Text(
                                      "${flights?.first.departure}",
                                      style: const TextStyle(
                                          color: Colors.black45, fontSize: 13),
                                    ),
                                  ],
                                ),
                                const Text(" - "),
                                Column(
                                  children: [
                                    Text(
                                      //landtime
                                      landTime ?? "",
                                      style: const TextStyle(fontSize: 16),
                                    ),
                                    //arrival place
                                    Text(
                                      '${flights?.last.arrival}',
                                      style: const TextStyle(
                                          color: Colors.black45),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  //maxStops
                                  '$maxStops',
                                  style: const TextStyle(fontSize: 16),
                                ),
                                //to change to segment time layover
                                Text(
                                  '$layoverTime',
                                  style: const TextStyle(),
                                ),
                              ],
                            ),
                            //total Duration
                            Text(
                              'Travel time: $duration h',
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(height: 4);
            },
            itemCount: provider.flightDatas.length,
          );
        }),
      ),
    );
  }
}
