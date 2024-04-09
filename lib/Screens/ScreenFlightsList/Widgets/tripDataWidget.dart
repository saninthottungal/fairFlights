import 'package:flutter/material.dart';

class TripDataWidget extends StatelessWidget {
  const TripDataWidget({
    super.key,
    required this.departureTime,
    required this.departure,
    required this.arrivalTime,
    required this.arrival,
    required this.maxStops,
    required this.isDirect,
    required this.layoverTime,
    required this.duration,
  });

  final String? departureTime;
  final String? departure;
  final String? arrivalTime;
  final String? arrival;
  final String? maxStops;
  final bool isDirect;
  final String? layoverTime;
  final String? duration;

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
                  departureTime ?? "",
                  style: const TextStyle(fontSize: 16),
                ),
                //departure place
                Text(
                  departure ?? '',
                  style: const TextStyle(color: Colors.black45, fontSize: 13),
                ),
              ],
            ),
            const Text(" - "),
            Column(
              children: [
                Text(
                  //landtime
                  arrivalTime ?? "",
                  style: const TextStyle(fontSize: 16),
                ),
                //arrival place
                Text(
                  arrival ?? '',
                  style: const TextStyle(color: Colors.black45),
                ),
              ],
            ),
          ],
        ),

        isDirect || layoverTime == null
            ? Text(
                maxStops ?? '',
                style: const TextStyle(
                    fontSize: 16, color: Color.fromARGB(255, 41, 148, 45)),
              )
            : Column(
                children: [
                  Text(
                    //maxStops
                    maxStops ?? '',
                    style: const TextStyle(fontSize: 16),
                  ),
                  //layover time
                  Text(
                    layoverTime == null ? '' : '$layoverTime h',
                    style: const TextStyle(),
                  ),
                ],
              ),
        //total Duration
        Text(
          'Travel time: $duration h',
        ),
      ],
    );
  }
}
