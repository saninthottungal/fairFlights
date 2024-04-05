import 'package:flight_booking/Providers/CalendarProvider/CalendarProvider.dart';
import 'package:flight_booking/Providers/HomeProviders/CounterProvider.dart';
import 'package:flight_booking/Providers/HomeProviders/FromToProvider.dart';
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
        ],
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              child: Text(
                '${fromToProvider.from.cityName} - ${fromToProvider.to.cityName}',
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
