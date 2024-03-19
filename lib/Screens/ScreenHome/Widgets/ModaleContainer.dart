import 'package:flight_booking/Core/Constants/colors.dart';
import 'package:flight_booking/Screens/ScreenHome/Widgets/Counter.dart';
import 'package:flight_booking/Screens/ScreenHome/Widgets/CustomChip.dart';
import 'package:flutter/material.dart';

class ModaleContainer extends StatelessWidget {
  const ModaleContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 10,
        left: 15,
        right: 15,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(
                    Icons.close,
                    color: Colors.black,
                    size: 27,
                  )),
              ElevatedButton(
                  style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.black)),
                  onPressed: () {},
                  child: const Text(
                    "Apply",
                    style: TextStyle(color: Colors.white),
                  )),
            ],
          ),
          const SizedBox(height: 5),
          const Divider(
            height: 0,
            color: Colors.black12,
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    "Travellers",
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.8),
                      fontWeight: FontWeight.w500,
                      fontSize: 23,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                const Counter(title: 'Adults', subtitle: 'Over 15'),
                const SizedBox(height: 8),
                const Counter(title: 'Children', subtitle: '2 - 15'),
                const SizedBox(height: 8),
                const Counter(title: 'Infants', subtitle: 'Under 2'),
                const Divider(color: Colors.black12, height: 20),
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    "Cabin class",
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.8),
                      fontWeight: FontWeight.w500,
                      fontSize: 23,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 70),
                  child: Wrap(
                    children: [
                      CustomChip(
                        title: "Economy",
                        isSelected: true,
                        onSelected: (value) {},
                        color: AppColor.customBlue,
                      ),
                      CustomChip(
                        title: "Premium Economy",
                        isSelected: true,
                        onSelected: (value) {},
                        color: AppColor.customBlue.withOpacity(0.5),
                      ),
                      CustomChip(
                        title: "Buissnes",
                        isSelected: true,
                        onSelected: (value) {},
                        color: AppColor.customBlue.withOpacity(0.5),
                      ),
                      CustomChip(
                        title: "First Class",
                        isSelected: true,
                        onSelected: (value) {},
                        color: AppColor.customBlue.withOpacity(0.5),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
