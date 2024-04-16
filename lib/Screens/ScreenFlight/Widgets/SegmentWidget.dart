import 'package:flight_booking/Models/FlightDataModel/flight.dart';
import 'package:flight_booking/Models/FlightDataModel/transfer.dart';
import 'package:flutter/material.dart';

class SegmentWidget extends StatelessWidget {
  const SegmentWidget(
      {super.key, required this.flight, required this.transfer});
  final Flight? flight;
  final Transfer transfer;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.transparent,
          backgroundImage: NetworkImage(
            "http://pics.avs.io/250/250/${flight?.operatedBy ?? flight?.operatingCarrier}.png",
            scale: 1,
          ),
        ),
        title: Text(
          '${transfer.airlines}',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.green,
          ),
        ),
        subtitle: Text(
          '${(flight!.duration! / 60).toStringAsFixed(1)} hours',
          style: const TextStyle(
            color: Colors.black54,
          ),
        ),
      ),
      ListTile(
        leading: const CircleAvatar(child: Icon(Icons.face)),
        title: Row(
          children: [
            Text(
              '${flight!.departureTime}',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
            ),
            const SizedBox(width: 45),
            Text(
              transfer.airlines!.first,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        subtitle: Row(
          children: [
            Text(flight!.departureDate!),
            const SizedBox(width: 21),
            Text(flight!.departure!)
          ],
        ),
      ),
      ListTile(
        leading: const CircleAvatar(child: Icon(Icons.face)),
        title: Row(
          children: [
            Text(
              '${flight!.arrivalTime}',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
            ),
            const SizedBox(width: 45),
            Text(
              flight!.arrival!,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        subtitle: Row(
          children: [
            Text(flight!.departureDate!),
            const SizedBox(width: 21),
            Text(flight!.arrival!)
          ],
        ),
      ),
    ]);
  }
}
