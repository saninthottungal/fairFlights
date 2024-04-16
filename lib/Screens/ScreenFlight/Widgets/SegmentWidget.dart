import 'package:flight_booking/Models/FlightModel.dart';
import 'package:flutter/material.dart';

class SegmentWidget extends StatelessWidget {
  const SegmentWidget({super.key, required this.flightData});
  final FlightModel flightData;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.transparent,
          backgroundImage: NetworkImage(
            "http://pics.avs.io/250/250/${flightData.airline?.iata}.png",
            scale: 1,
          ),
        ),
        title: Text(
          flightData.airline?.name ?? flightData.airline?.allianceName ?? '',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(
                int.parse(flightData.airline?.brandColor ?? '', radix: 16)),
          ),
        ),
        subtitle: Text(
          '${flightData.duration} hours',
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
              '${flightData.departureTime}',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
            ),
            const SizedBox(width: 45),
            Text(
              flightData.departure?.city ?? flightData.departure?.name ?? '',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        subtitle: Row(
          children: [
            Text(flightData.departureDate!),
            const SizedBox(width: 21),
            Text(flightData.departure?.cityCode ?? '')
          ],
        ),
      ),
      ListTile(
        leading: const CircleAvatar(child: Icon(Icons.face)),
        title: Row(
          children: [
            Text(
              '${flightData.arrivalTime}',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
            ),
            const SizedBox(width: 45),
            Text(
              flightData.arrival?.city ?? '',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        subtitle: Row(
          children: [
            Text(flightData.departureDate!),
            const SizedBox(width: 21),
            Text(flightData.arrival?.cityCode ?? '')
          ],
        ),
      ),
    ]);
  }
}
