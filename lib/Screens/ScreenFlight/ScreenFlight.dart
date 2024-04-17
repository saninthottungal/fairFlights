import 'package:flight_booking/Models/FlightDataModel/proposals.dart';
import 'package:flight_booking/Models/FlightModel.dart';
import 'package:flight_booking/Providers/FlightProviders/FlightDataProvider.dart';
import 'package:flight_booking/Providers/HomeProviders/FromToProvider.dart';
import 'package:flight_booking/Screens/ScreenFlight/Widgets/SegmentWidget.dart';
import 'package:flight_booking/Screens/ScreenFlight/Widgets/SeparatorWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScreenFlight extends StatelessWidget {
  final Proposals proposal;
  const ScreenFlight({super.key, required this.proposal});

  @override
  Widget build(BuildContext context) {
    final flightDataProvider =
        Provider.of<FlightDataProvider>(context, listen: false);
    final width = MediaQuery.of(context).size.width;
    final fromToProvider = Provider.of<FromToProvider>(context, listen: false);
    final firstSegmentDuration =
        (proposal.segmentDurations!.first / 60).toStringAsFixed(1);
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
              const Text("Best Price For 1 Passenger"),
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
              const SizedBox(height: 60)
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: SizedBox(
        width: width * 0.9,
        child: CupertinoButton(
          color: Colors.green,
          child: Text("Buy for \u20B9${proposal.terms?.cost?.unifiedPrice}"),
          onPressed: () {},
        ),
      ),
    );
  }
}
