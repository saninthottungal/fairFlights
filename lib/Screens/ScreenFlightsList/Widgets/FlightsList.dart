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
              final flight =
                  provider.flightDatas[index].segment?.first.flight?.first;
              final time = provider
                  .flightDatas[index].segment?.first.flight?.first.arrivalTime;
              return SizedBox(
                height: 90,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Text(
                        flight?.aircraft ?? "",
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
                            "http://pics.avs.io/200/200/${flight?.operatedBy ?? flight?.operatingCarrier}.png",
                            scale: 1,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              time ?? "",
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            const Text(
                              "DEL",
                              style: TextStyle(color: Colors.black45),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Text(
                              "24h 50m",
                              style: TextStyle(
                                  color: Colors.black38, fontSize: 13),
                            ),
                            Container(
                              width: 50,
                              height: 1,
                              color: Colors.black38,
                            ),
                            const Text(
                              "1 stop",
                              style: TextStyle(
                                  color: Colors.black38, fontSize: 13),
                            ),
                          ],
                        ),
                        const Column(
                          // mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "07:15",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            Text(
                              "DEL",
                              style: TextStyle(color: Colors.black45),
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
            itemCount: 10,
          );
        }),
      ),
    );
  }
}
