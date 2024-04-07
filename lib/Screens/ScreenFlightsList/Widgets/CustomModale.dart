import 'package:flight_booking/Core/Constants/colors.dart';
import 'package:flutter/material.dart';

class CustomModaleWidget extends StatelessWidget {
  const CustomModaleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Container(
      margin: const EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
      height: height * 0.4,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
              width: double.infinity,
              child: Text(
                "Sort",
                style: TextStyle(
                  color: AppColor.customBlue,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Cheapest First",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.black54,
                ),
              ),
              Radio(value: true, groupValue: true, onChanged: (value) {})
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Trip Duration",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.black54,
                ),
              ),
              Radio(value: true, groupValue: false, onChanged: (value) {})
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Rating",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.black54,
                ),
              ),
              Radio(value: true, groupValue: false, onChanged: (value) {})
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Departure Time",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.black54,
                ),
              ),
              Radio(value: true, groupValue: false, onChanged: (value) {})
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Arrival Time",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.black54,
                ),
              ),
              Radio(value: true, groupValue: false, onChanged: (value) {})
            ],
          ),
        ],
      ),
    );
  }
}
