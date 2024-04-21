import 'package:flight_booking/models/flight_model.dart';
import 'package:flutter/material.dart';

class SeparatorWidget extends StatelessWidget {
  const SeparatorWidget(
      {super.key, required this.flightData, required this.duration});

  final FlightModel flightData;
  final String duration;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: const Color.fromARGB(255, 221, 222, 223),
      child: ListTile(
        leading: const CircleAvatar(
          child: Icon(Icons.directions_walk),
        ),
        title: Text(
          "Layover in ${flightData.arrival?.city ?? ''}",
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          '$duration hours',
          style: const TextStyle(
            color: Colors.black54,
          ),
        ),
      ),
    );
  }
}
