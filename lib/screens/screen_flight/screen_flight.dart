import 'package:flight_booking/core/constants/enums.dart';
import 'package:flight_booking/models/flight_data_model/proposals.dart';
import 'package:flight_booking/models/flight_model.dart';
import 'package:flight_booking/providers/agency_provider.dart';
import 'package:flight_booking/providers/flight_providers/flight_data_provider.dart';
import 'package:flight_booking/providers/home_providers/counter_provider.dart';
import 'package:flight_booking/providers/home_providers/from_to_provider.dart';
import 'package:flight_booking/providers/home_providers/trip_chip_provider.dart';
import 'package:flight_booking/providers/web_view_provider/web_view_provider.dart';
import 'package:flight_booking/screens/screen_flight/widgets/segment_widget.dart';
import 'package:flight_booking/screens/screen_flight/widgets/separator_widget.dart';
import 'package:flight_booking/screens/screen_web_view/screen_web_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScreenFlight extends StatelessWidget {
  final Proposals proposal;
  const ScreenFlight({super.key, required this.proposal});

  @override
  Widget build(BuildContext context) {
    final messenger = ScaffoldMessenger.of(context);
    final flightDataProvider =
        Provider.of<FlightDataProvider>(context, listen: false);
    final width = MediaQuery.of(context).size.width;
    final fromToProvider = Provider.of<FromToProvider>(context, listen: false);
    final firstSegmentDuration =
        (proposal.segmentDurations!.first / 60).toStringAsFixed(1);
    final secondSegmentDuration =
        (proposal.segmentDurations!.last / 60).toStringAsFixed(1);
    final tripProvider = Provider.of<TripChipProvider>(context, listen: false);
    final countprovider =
        Provider.of<CounterProvider>(context, listen: false).total;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 238, 240, 242),
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 20, left: 20, right: 20, bottom: 5),
                  child: Text(
                    '\u20B9${proposal.terms?.cost?.unifiedPrice ?? '00'}',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Text("Best Price For $countprovider Passenger"),
              const SizedBox(height: 20),
              ListTile(
                title: Row(
                  children: [
                    Text(
                      '${fromToProvider.from.cityName ?? fromToProvider.from.name}',
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      " - ",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '${fromToProvider.to.cityName ?? fromToProvider.to.name}',
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                subtitle: Text(
                  "Travel time : $firstSegmentDuration hours",
                  style: const TextStyle(fontSize: 16, color: Colors.black54),
                ),
              ),
              Card(
                elevation: 0,
                margin: const EdgeInsets.only(left: 12, right: 12, bottom: 20),
                color: Colors.white,
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (ctx, index) {
                    final flight = proposal.segment?.first.flight![index];
                    final flightData = FlightModel.fromFlight(
                        flight: flight, flightDataProvider: flightDataProvider);

                    return SegmentWidget(flightData: flightData);
                  },
                  separatorBuilder: (ctx, index) {
                    final flight1 = proposal.segment?.first.flight![index];
                    final flightData1 = FlightModel.fromFlight(
                        flight: flight1,
                        flightDataProvider: flightDataProvider);
                    final flight2 = proposal.segment?.first.flight![index + 1];
                    final flightData2 = FlightModel.fromFlight(
                        flight: flight2,
                        flightDataProvider: flightDataProvider);
                    int? durationInMinutes;
                    String duration = '';
                    if (flightData2.arrivalTimeAsDateTime != null &&
                        flightData1.arrivalTimeAsDateTime != null) {
                      durationInMinutes = flightData2.arrivalTimeAsDateTime!
                          .difference(flightData1.arrivalTimeAsDateTime!)
                          .inMinutes;
                    }
                    if (durationInMinutes != null) {
                      duration = (durationInMinutes / 60).toStringAsFixed(1);
                    }

                    return SeparatorWidget(
                        flightData: flightData1, duration: duration);
                  },
                  itemCount: proposal.segment!.first.flight!.length,
                ),
              ),
              tripProvider.value == TripType.oneWay
                  ? const SizedBox(height: 60)
                  : const SizedBox(height: 30),
              //roundTripData
              tripProvider.value == TripType.oneWay
                  ? const SizedBox()
                  : ListTile(
                      title: Row(
                        children: [
                          Text(
                            '${fromToProvider.to.cityName ?? fromToProvider.to.name}',
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Text(
                            " - ",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '${fromToProvider.from.cityName ?? fromToProvider.from.name}',
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      subtitle: Text(
                        "Travel time : $secondSegmentDuration hours",
                        style: const TextStyle(
                            fontSize: 16, color: Colors.black54),
                      ),
                    ),
              tripProvider.value == TripType.oneWay
                  ? const SizedBox()
                  : Card(
                      elevation: 0,
                      margin: const EdgeInsets.only(
                          left: 12, right: 12, bottom: 20),
                      color: Colors.white,
                      child: ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (ctx, index) {
                          final flight = proposal.segment?.last.flight![index];
                          final flightData = FlightModel.fromFlight(
                              flight: flight,
                              flightDataProvider: flightDataProvider);

                          return SegmentWidget(flightData: flightData);
                        },
                        separatorBuilder: (ctx, index) {
                          final flight1 = proposal.segment?.last.flight![index];
                          final flightData1 = FlightModel.fromFlight(
                              flight: flight1,
                              flightDataProvider: flightDataProvider);
                          final flight2 =
                              proposal.segment?.last.flight![index + 1];
                          final flightData2 = FlightModel.fromFlight(
                              flight: flight2,
                              flightDataProvider: flightDataProvider);
                          int? durationInMinutes;
                          String duration = '';
                          if (flightData2.arrivalTimeAsDateTime != null &&
                              flightData1.arrivalTimeAsDateTime != null) {
                            durationInMinutes = flightData2
                                .arrivalTimeAsDateTime!
                                .difference(flightData1.arrivalTimeAsDateTime!)
                                .inMinutes;
                          }
                          if (durationInMinutes != null) {
                            duration =
                                (durationInMinutes / 60).toStringAsFixed(1);
                          }

                          return SeparatorWidget(
                              flightData: flightData1, duration: duration);
                        },
                        itemCount: proposal.segment!.last.flight!.length,
                      ),
                    ),
              tripProvider.value == TripType.oneWay
                  ? const SizedBox()
                  : const SizedBox(height: 60)
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: SizedBox(
        width: width * 0.9,
        child: CupertinoButton(
          color: Colors.green,
          pressedOpacity: 0.9,
          child: Text("Buy for \u20B9${proposal.terms?.cost?.unifiedPrice}"),
          onPressed: () async {
            showDialog(
                barrierDismissible: false,
                context: context,
                builder: (ctx) {
                  return const Dialog.fullscreen(
                    backgroundColor: Colors.transparent,
                    insetAnimationDuration: Duration(seconds: 1),
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                });
            final agencyProvider =
                Provider.of<AgencyProvider>(context, listen: false);
            agencyProvider.setPrice =
                '\u20B9${proposal.terms?.cost?.unifiedPrice ?? 00}';
            final flight = proposal.segment?.first.flight?.first;
            final flightData = FlightModel.fromFlight(
              flight: flight,
              flightDataProvider: flightDataProvider,
            );
            final airline = flightData.airline?.name ??
                flightData.airline?.allianceName ??
                '';
            agencyProvider.setAirline = airline;

            final webViewProvider =
                Provider.of<WebViewProvider>(context, listen: false);
            final agencyLink = await webViewProvider.agencyLinkRequest(
              urlCode: proposal.terms?.cost?.url,
              sId: flightDataProvider.searchId,
            );

            if (agencyLink != null) {
              Navigator.pop(context);
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ScreenWebView(agencyLink: agencyLink),
              ));
            } else {
              messenger.showSnackBar(const SnackBar(
                  content: Text("Could't load Agency Website. try later")));
            }
          },
        ),
      ),
    );
  }
}
