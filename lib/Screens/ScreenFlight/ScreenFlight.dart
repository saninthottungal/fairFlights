import 'package:flight_booking/Models/FlightDataModel/proposals.dart';
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
    final width = MediaQuery.of(context).size.width;
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
                      top: 20, left: 20, right: 20, bottom: 10),
                  child: Text(
                    '\u20B9${proposal.terms?.cost?.unifiedPrice}',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 40,
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
                      '${Provider.of<FromToProvider>(context, listen: false).from.cityName ?? Provider.of<FromToProvider>(context, listen: false).from.name}',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      " - ",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '${Provider.of<FromToProvider>(context, listen: false).to.cityName ?? Provider.of<FromToProvider>(context, listen: false).to.cityName}',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                subtitle: Text(
                  "Travel time : ${proposal.totalDuration}",
                  style: const TextStyle(fontSize: 16, color: Colors.black54),
                ),
              ),
              Card(
                margin: const EdgeInsets.only(left: 12, right: 12, bottom: 20),
                color: Colors.white,
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final flight = proposal.segment?.first.flight![index];
                    final carriers = proposal.carriers!.first;
                    return SegmentWidget(flight: flight, carrier: carriers);
                  },
                  separatorBuilder: (context, index) {
                    final flight = proposal.segment?.first.flight![index];
                    return SeparatorWidget(flight: flight);
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
