import 'package:flight_booking/Models/FlightModel.dart';
import 'package:flutter/material.dart';

class TripDataWidget extends StatelessWidget {
  const TripDataWidget({super.key, required this.flightModel});

  final FlightModel? flightModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                //arrival time
                Text(
                  flightModel?.departureTime ?? "",
                  style: const TextStyle(fontSize: 16),
                ),
                //departure place
                Text(
                  flightModel?.departure ?? '',
                  style: const TextStyle(color: Colors.black45, fontSize: 13),
                ),
              ],
            ),
            const Text(" - "),
            Column(
              children: [
                Text(
                  //landtime
                  flightModel?.arrivalTime ?? "",
                  style: const TextStyle(fontSize: 16),
                ),
                //arrival place
                Text(
                  flightModel?.arrival ?? '',
                  style: const TextStyle(color: Colors.black45),
                ),
              ],
            ),
          ],
        ),

        flightModel!.isDirect || flightModel?.layoverTime == null
            ? Text(
                flightModel?.maxStops ?? '',
                style: const TextStyle(
                    fontSize: 16, color: Color.fromARGB(255, 41, 148, 45)),
              )
            : Column(
                children: [
                  Text(
                    //maxStops
                    flightModel?.maxStops ?? '',
                    style: const TextStyle(fontSize: 16),
                  ),
                  //layover time
                  Text(
                    flightModel?.layoverTime == null
                        ? ''
                        : '${flightModel?.layoverTime} h',
                    style: const TextStyle(),
                  ),
                ],
              ),
        //total Duration
        Text(
          'Travel time: ${flightModel?.duration} h',
        ),
      ],
    );
  }
}
