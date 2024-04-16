import 'package:flight_booking/Models/FlightDataModel/flight.dart';
import 'package:flutter/material.dart';

class SeparatorWidget extends StatelessWidget {
  const SeparatorWidget({super.key, required this.flight});

  final Flight? flight;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.black12,
      child: ListTile(
        leading: const CircleAvatar(
          child: Icon(Icons.assist_walker),
        ),
        title: Text(
          "Layover in ${flight!.arrival!}",
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          '${flight!.number}',
          style: const TextStyle(
            color: Colors.black54,
          ),
        ),
      ),
    );
  }
}
