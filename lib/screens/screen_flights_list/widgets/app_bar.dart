import 'package:flight_booking/core/constants/enums.dart';
import 'package:flight_booking/providers/calendar_provider/calendar_provider.dart';
import 'package:flight_booking/providers/home_providers/counter_provider.dart';
import 'package:flight_booking/providers/home_providers/from_to_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final fromToProvider = Provider.of<FromToProvider>(context, listen: false);

    final passengerProvider =
        Provider.of<CounterProvider>(context, listen: false);
    return AppBar(
        centerTitle: false,
        actions: [
          IconButton(onPressed: onPressed, icon: const Icon(Icons.sort)),
          IconButton(
              onPressed: () {
                context.read<CalendarProvider>().way = TripWay.departureWay;
                Navigator.of(context).pushNamed('/calendar');
              },
              icon: const Icon(Icons.edit_calendar_outlined))
        ],
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              child: Text(
                '${fromToProvider.from.cityName ?? fromToProvider.from.name} - ${fromToProvider.to.cityName ?? fromToProvider.to.name}',
                style: const TextStyle(fontSize: 20),
                textAlign: TextAlign.start,
              ),
            ),
            SizedBox(
              width: double.infinity,
              child:
                  Consumer<CalendarProvider>(builder: (context, provider, _) {
                final date = formatDate(provider.departureDate);
                return Text(
                  "$date, ${passengerProvider.total} passenger",
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                );
              }),
            )
          ],
        ));
  }

  String formatDate(DateTime dateTime) {
    final DateFormat formatter = DateFormat('dd MMMM');
    return formatter.format(dateTime).toLowerCase();
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
