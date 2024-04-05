import 'package:flight_booking/Providers/FlightProviders/FlightDataProvider.dart';
import 'package:flight_booking/Screens/ScreenFlightsList/Widgets/AppBar.dart';
import 'package:flight_booking/Screens/ScreenFlightsList/Widgets/CustomModale.dart';
import 'package:flight_booking/Screens/ScreenFlightsList/Widgets/FlightsList.dart';
import 'package:flight_booking/Screens/ScreenFlightsList/Widgets/LoadingWidget.dart';
import 'package:flight_booking/Screens/ScreenFlightsList/Widgets/PriceCalendar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScreenFlightsList extends StatelessWidget {
  const ScreenFlightsList({super.key});

  @override
  Widget build(BuildContext context) {
    //final height = MediaQuery.of(context).size.height;
    //final width = MediaQuery.of(context).size.width;
    return Consumer<FlightDataProvider>(builder: (context, flightProvider, _) {
      return flightProvider.isLoading
          ? const IsLoadingWidget()
          : Scaffold(
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
                child: Column(
                  children: [
                    PriceCalendarWidget(),
                    Divider(),
                    FlightsListWidget(),
                  ],
                ),
              ));
    });
  }
}
