import 'package:flight_booking/Models/FlightModel.dart';
import 'package:flight_booking/Screens/ScreenFlight/Widgets/ContainerWidget.dart';
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
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        subtitle: Text(
          '${flightData.duration} hours',
          style: const TextStyle(
            color: Colors.black54,
          ),
        ),
      ),
      ContainerWidget(
        time: flightData.departureTime,
        date: flightData.departureDate,
        city: flightData.departure?.city,
        cityCode: flightData.departure?.cityCode,
        airportName: flightData.departure?.name,
        isFirst: true,
        isLast: false,
      ),
      ContainerWidget(
        time: flightData.arrivalTime,
        date: flightData.arrivalDate,
        city: flightData.arrival?.city,
        cityCode: flightData.arrival?.cityCode,
        airportName: flightData.arrival?.name,
        isFirst: false,
        isLast: true,
      )
    ]);
  }
}
