import 'package:flight_booking/core/constants/colors.dart';
import 'package:flight_booking/core/constants/enums.dart';
import 'package:flight_booking/providers/flight_providers/flight_data_provider.dart';
import 'package:flight_booking/providers/flight_providers/sort_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomModaleWidget extends StatelessWidget {
  const CustomModaleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Container(
      margin: const EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
      height: height * 0.45,
      child: Consumer<SortProvider>(builder: (context, provider, _) {
        final flightProvider =
            Provider.of<FlightDataProvider>(context, listen: false);
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
                width: double.infinity,
                child: Text(
                  "Sort",
                  style: TextStyle(
                    color: AppColor.customBlue,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "None",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black54,
                  ),
                ),
                Radio(
                    value: SortValues.none,
                    groupValue: provider.selectedGroupValue,
                    onChanged: (value) async {
                      provider.changeSort = value ?? SortValues.none;
                      flightProvider.sortFlights(SortValues.none);
                      await Future.delayed(const Duration(milliseconds: 500));
                      Navigator.pop(context);
                    })
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Cheapest First",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black54,
                  ),
                ),
                Radio(
                    value: SortValues.cheapestFirst,
                    groupValue: provider.selectedGroupValue,
                    onChanged: (value) async {
                      provider.changeSort = value ?? SortValues.cheapestFirst;
                      flightProvider.sortFlights(SortValues.cheapestFirst);
                      await Future.delayed(const Duration(milliseconds: 500));
                      Navigator.pop(context);
                    })
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Trip Duration",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black54,
                  ),
                ),
                Radio(
                    value: SortValues.tripDuration,
                    groupValue: provider.selectedGroupValue,
                    onChanged: (value) async {
                      provider.changeSort = value ?? SortValues.tripDuration;
                      flightProvider.sortFlights(SortValues.tripDuration);
                      await Future.delayed(const Duration(milliseconds: 500));
                      Navigator.pop(context);
                    })
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Rating",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black54,
                  ),
                ),
                Radio(
                    value: SortValues.rating,
                    groupValue: provider.selectedGroupValue,
                    onChanged: (value) async {
                      provider.changeSort = value ?? SortValues.rating;
                      flightProvider.sortFlights(SortValues.rating);
                      await Future.delayed(const Duration(milliseconds: 500));
                      Navigator.pop(context);
                    })
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Departure Time",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black54,
                  ),
                ),
                Radio(
                    value: SortValues.departureTime,
                    groupValue: provider.selectedGroupValue,
                    onChanged: (value) async {
                      provider.changeSort = value ?? SortValues.departureTime;
                      flightProvider.sortFlights(SortValues.departureTime);
                      await Future.delayed(const Duration(milliseconds: 500));
                      Navigator.pop(context);
                    })
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Arrival Time",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black54,
                  ),
                ),
                Radio(
                    value: SortValues.arrivalTime,
                    groupValue: provider.selectedGroupValue,
                    onChanged: (value) async {
                      provider.changeSort = value ?? SortValues.arrivalTime;
                      flightProvider.sortFlights(SortValues.arrivalTime);
                      await Future.delayed(const Duration(milliseconds: 500));
                      Navigator.pop(context);
                    })
              ],
            ),
          ],
        );
      }),
    );
  }
}
