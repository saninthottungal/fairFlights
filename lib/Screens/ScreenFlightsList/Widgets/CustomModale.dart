import 'package:flutter/material.dart';

class CustomModaleWidget extends StatelessWidget {
  const CustomModaleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return SizedBox(
      height: height * 0.5,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Text("Sort"),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Cheapest First"),
              Radio(value: true, groupValue: true, onChanged: (value) {})
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Trip Duration"),
              Radio(value: true, groupValue: true, onChanged: (value) {})
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Rating"),
              Radio(value: true, groupValue: true, onChanged: (value) {})
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Departure Time"),
              Radio(value: true, groupValue: true, onChanged: (value) {})
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Arrival Time"),
              Radio(value: true, groupValue: true, onChanged: (value) {})
            ],
          ),
        ],
      ),
    );
  }
}
