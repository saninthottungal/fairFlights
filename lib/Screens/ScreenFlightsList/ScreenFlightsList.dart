import 'package:flight_booking/Providers/FlightProviders/FlightDataProvider.dart';
import 'package:flight_booking/Screens/ScreenFlightsList/Widgets/AppBar.dart';
import 'package:flight_booking/Screens/ScreenFlightsList/Widgets/CustomModale.dart';
import 'package:flight_booking/Screens/ScreenFlightsList/Widgets/FlightsList.dart';
import 'package:flight_booking/Screens/ScreenFlightsList/Widgets/LoadingWidget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScreenFlightsList extends StatelessWidget {
  const ScreenFlightsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<FlightDataProvider>(builder: (context, flightProvider, _) {
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
              body: const SafeArea(
                child: FlightsListWidget(),
              ));
    });
  }
}
