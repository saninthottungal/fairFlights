import 'package:flutter/material.dart';

class CheckInCheckOutDate extends StatelessWidget {
  final String title;
  final String day;
  final String month;
  const CheckInCheckOutDate({
    super.key,
    required this.title,
    required this.day,
    required this.month,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.grey[600],
              fontWeight: FontWeight.w600,
              fontSize: 17,
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                "05",
                style: TextStyle(
                  color: Color.fromRGBO(20, 74, 238, 1),
                  fontWeight: FontWeight.w400,
                  fontSize: 55,
                ),
              ),
              const SizedBox(width: 13),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    month,
                    style: TextStyle(
                      color: Colors.grey[800],
                      fontWeight: FontWeight.w500,
                      fontSize: 26,
                    ),
                  ),
                  Text(
                    day,
                    style: TextStyle(
                      color: Colors.grey[800],
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
