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
        padding: const EdgeInsets.symmetric(horizontal: 15),
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
              String? maxStops;
              if (flightData.isDirect != null) {
                maxStops = !flightData.isDirect!
                    ? '${flightData.maxStops} stops'
                    : 'Direct';
              }

              return SizedBox(
                height: 90,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Text(
                        flights?.first.aircraft ??
                            flights?.first.marketingCarrier ??
                            '',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColor.customBlue,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.transparent,
                          backgroundImage: NetworkImage(
                            "http://pics.avs.io/250/250/${flights?.first.operatedBy ?? flights?.first.operatingCarrier}.png",
                            scale: 1,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              arrivalTime ?? "",
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            Text(
                              "${flights?.first.departure}",
                              style: const TextStyle(color: Colors.black45),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              '$duration hours',
                              style: const TextStyle(
                                  color: Colors.black38, fontSize: 13),
                            ),
                            Container(
                              width: 50,
                              height: 1,
                              color: Colors.black38,
                            ),
                            Text(
                              '$maxStops',
                              style: const TextStyle(
                                  color: Colors.black38, fontSize: 13),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              '$landTime',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            Text(
                              '${flights?.last.arrival}',
                              style: const TextStyle(color: Colors.black45),
                            ),
                          ],
                        ),
                        const SizedBox(width: 5),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: Text(
                            '\u20B9${provider.flightDatas[index].terms?.cost?.price}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.black87,
                            ),
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
            itemCount: provider.flightDatas.length,
          );
        }),
      ),
    );
  }
}
