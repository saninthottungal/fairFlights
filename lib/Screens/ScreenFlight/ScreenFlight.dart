import 'package:flight_booking/Models/FlightDataModel/proposals.dart';
import 'package:flight_booking/Providers/HomeProviders/FromToProvider.dart';
import 'package:flight_booking/Screens/ScreenFlight/Widgets/SegmentWidget.dart';
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
                  padding: const EdgeInsets.all(20),
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
              ListTile(
                title: Row(
                  children: [
                    Text(
                      '${Provider.of<FromToProvider>(context, listen: false).from.cityName}',
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
                      '${Provider.of<FromToProvider>(context, listen: false).to.cityName}',
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
                    return const SegmentWidget();
                  },
                  separatorBuilder: (context, index) {
                    return const Card(
                      elevation: 0,
                      color: Colors.black12,
                      child: ListTile(
                        leading: CircleAvatar(
                          child: Icon(Icons.assist_walker),
                        ),
                        title: Text(
                          "Layover in Dallas",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          "02h 15m",
                          style: TextStyle(
                            color: Colors.black54,
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: 3,
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
