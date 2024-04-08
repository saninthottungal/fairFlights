import 'package:flight_booking/Providers/FlightProviders/DataLoadingProvider.dart';
import 'package:flight_booking/Providers/FlightProviders/FlightDataProvider.dart';
import 'package:flight_booking/Screens/ScreenFlightsList/Widgets/AppBar.dart';
import 'package:flight_booking/Screens/ScreenFlightsList/Widgets/CustomModale.dart';
import 'package:flight_booking/Screens/ScreenFlightsList/Widgets/LoadingWidget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flight_booking/Core/Constants/colors.dart';

class ScreenFlightsList extends StatelessWidget {
  const ScreenFlightsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DataLoadingProvider>(builder: (context, flightProvider, _) {
      return flightProvider.isLoading
          ? const IsLoadingWidget()
          : Scaffold(
              backgroundColor: const Color.fromARGB(255, 238, 240, 242),
              appBar: CustomAppBar(
                onPressed: () async {
                  showModalBottomSheet(
                      context: context,
                      builder: (ctx) {
                        return const CustomModaleWidget();
                      });
                },
              ),
              body: SafeArea(
                child: Consumer<FlightDataProvider>(
                    builder: (context, provider, _) {
                  return Padding(
                    padding:
                        const EdgeInsets.only(top: 10, left: 10, right: 10),
                    child: ListView.separated(
                      itemBuilder: (context, index) {
                        final flightData = provider.proposals[index];
                        final flights = flightData.segment?.first.flight;
                        final departureTime = flightData
                            .segment?.first.flight?.first.departureTime;
                        final arrivalTime =
                            flightData.segment?.last.flight?.last.arrivalTime;
                        String? duration;
                        if (flightData.totalDuration != null) {
                          duration = ((flightData.totalDuration)! / 60)
                              .toStringAsFixed(1);
                        }
                        String layoverTime = '';
                        bool isDirect = false;
                        String? maxStops;
                        if (flightData.segment?.first.transfers?.first
                                .durationSeconds !=
                            null) {
                          layoverTime = (flightData.segment!.first.transfers!
                                      .first.durationSeconds! /
                                  3600)
                              .toStringAsFixed(1);
                        }

                        if (flightData.isDirect != null) {
                          isDirect = flightData.isDirect!;
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      //price

                                      Text(
                                        '\u20B9${flightData.terms?.cost?.unifiedPrice}',
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Column(
                                            children: [
                                              //arrival time
                                              Text(
                                                departureTime ?? "",
                                                style: const TextStyle(
                                                    fontSize: 16),
                                              ),
                                              //departure place
                                              Text(
                                                "${flights?.first.departure}",
                                                style: const TextStyle(
                                                    color: Colors.black45,
                                                    fontSize: 13),
                                              ),
                                            ],
                                          ),
                                          const Text(" - "),
                                          Column(
                                            children: [
                                              Text(
                                                //landtime
                                                arrivalTime ?? "",
                                                style: const TextStyle(
                                                    fontSize: 16),
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
                                            style:
                                                const TextStyle(fontSize: 16),
                                          ),
                                          //to change to segment time layover
                                          Text(
                                            isDirect ? '' : '$layoverTime h',
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
                      itemCount: provider.numberOfProposals,
                    ),
                  );
                }),
              ));
    });
  }
}
