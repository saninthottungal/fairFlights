import 'package:flight_booking/Core/Constants/enums.dart';
import 'package:flight_booking/Providers/FlightProviders/DataLoadingProvider.dart';
import 'package:flight_booking/Providers/FlightProviders/FlightDataProvider.dart';
import 'package:flight_booking/Providers/HomeProviders/TripChipProvider.dart';
import 'package:flight_booking/Screens/ScreenFlightsList/Widgets/AppBar.dart';
import 'package:flight_booking/Screens/ScreenFlightsList/Widgets/CustomModale.dart';
import 'package:flight_booking/Screens/ScreenFlightsList/Widgets/LoadingWidget.dart';
import 'package:flight_booking/Screens/ScreenFlightsList/Widgets/tripDataWidget.dart';
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
                        //proposals per index
                        final flightData = provider.proposals[index];

                        //oneWay
                        final oneWaySegment = flightData.segment?.first;

                        final oneWayDepartureTime =
                            oneWaySegment?.flight?.first.departureTime;
                        final oneWayDeparture =
                            oneWaySegment?.flight?.first.departure;
                        final oneWayArrivalTime =
                            oneWaySegment?.flight?.last.arrivalTime;
                        final oneWayArrival =
                            oneWaySegment?.flight?.last.arrival;
                        bool oneWayIsDirect = false;
                        String? oneWayMaxStops;
                        String? oneWayLayoverTime;
                        String? oneWayDuration = '';

                        //functions

                        if (oneWaySegment != null) {
                          oneWayDuration =
                              (flightData.segmentDurations!.first / 60)
                                  .toStringAsFixed(1);
                        }

                        if (oneWaySegment?.transfers?.first.durationSeconds !=
                            null) {
                          oneWayLayoverTime =
                              (oneWaySegment!.flight!.last.delay! / 60)
                                  .toStringAsFixed(1);
                        }
                        if (flightData.isDirect != null) {
                          if (flightData.isDirect! ||
                              oneWayLayoverTime == null) {
                            oneWayMaxStops = 'Direct';
                          } else {
                            oneWayMaxStops = '${flightData.maxStops} layovers';
                          }
                        }

                        //roundtrip
                        final roundWaySegment = flightData.segment?.last;

                        final roundWayDepartureTime =
                            roundWaySegment?.flight?.first.departureTime;
                        final roundWayDeparture =
                            roundWaySegment?.flight?.first.departure;
                        final roundWayArrivalTime =
                            roundWaySegment?.flight?.last.arrivalTime;
                        final roundWayArrival =
                            roundWaySegment?.flight?.last.arrival;
                        bool roundWayIsDirect = false;
                        String? roundWayMaxStops;
                        String? roundWayLayoverTime;
                        String? roundWayDuration = '';

                        //functions

                        if (roundWaySegment != null) {
                          roundWayDuration =
                              (flightData.segmentDurations!.last / 60)
                                  .toStringAsFixed(1);
                        }

                        if (roundWaySegment?.transfers?.first.durationSeconds !=
                            null) {
                          roundWayLayoverTime =
                              (roundWaySegment!.flight!.last.delay! / 60)
                                  .toStringAsFixed(1);
                        }

                        if (flightData.isDirect != null) {
                          roundWayIsDirect = flightData.isDirect!;

                          if (flightData.isDirect != null) {
                            if (flightData.isDirect! ||
                                roundWayLayoverTime == null) {
                              roundWayMaxStops = 'Direct';
                            } else {
                              roundWayMaxStops =
                                  '${flightData.maxStops} layovers';
                            }
                          }
                        }

                        final TripType tripType = Provider.of<TripChipProvider>(
                                context,
                                listen: false)
                            .value;

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
                                          "http://pics.avs.io/250/250/${oneWaySegment?.flight?.first.operatedBy ?? oneWaySegment?.flight?.first.operatingCarrier}.png",
                                          scale: 1,
                                        ),
                                      ),
                                    ],
                                  ),
                                  TripDataWidget(
                                    isDirect: oneWayIsDirect,
                                    departureTime: oneWayDepartureTime,
                                    maxStops: oneWayMaxStops,
                                    layoverTime: oneWayLayoverTime,
                                    arrivalTime: oneWayArrivalTime,
                                    duration: oneWayDuration,
                                    departure: oneWayDeparture,
                                    arrival: oneWayArrival,
                                  ),
                                  tripType == TripType.oneWay
                                      ? const SizedBox(width: 0, height: 0)
                                      : const SizedBox(height: 20),
                                  tripType == TripType.oneWay
                                      ? const SizedBox(width: 0, height: 0)
                                      : TripDataWidget(
                                          isDirect: roundWayIsDirect,
                                          departureTime: roundWayDepartureTime,
                                          maxStops: roundWayMaxStops,
                                          layoverTime: roundWayLayoverTime,
                                          arrivalTime: roundWayArrivalTime,
                                          duration: roundWayDuration,
                                          departure: roundWayDeparture,
                                          arrival: roundWayArrival,
                                        ),
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
