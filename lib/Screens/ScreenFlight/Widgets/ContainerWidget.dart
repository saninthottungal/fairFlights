import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class ContainerWidget extends StatelessWidget {
  const ContainerWidget({
    super.key,
    required this.time,
    required this.date,
    required this.city,
    required this.cityCode,
    required this.airportName,
    required this.isFirst,
    required this.isLast,
  });

  final String? time;
  final String? date;
  final String? city;
  final String? cityCode;
  final String? airportName;
  final bool isLast;
  final bool isFirst;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Padding(
        padding: const EdgeInsets.only(left: 25),
        child: TimelineTile(
          isLast: isLast,
          isFirst: isFirst,
          indicatorStyle: const IndicatorStyle(width: 15),
          beforeLineStyle: const LineStyle(color: Colors.black26),
          endChild: Container(
            margin:
                const EdgeInsets.only(left: 10, right: 10, bottom: 5, top: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      time ?? '',
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 17,
                      ),
                    ),
                    Text(
                      date ?? '',
                      style:
                          const TextStyle(color: Colors.black54, fontSize: 13),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      city ?? '',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                    Text(
                      '$airportName...,$cityCode',
                      style:
                          const TextStyle(fontSize: 13, color: Colors.black54),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
