import 'package:flight_booking/Core/Constants/colors.dart';
import 'package:flight_booking/Screens/ScreenCalendar/ScreenCalendar.dart';
import 'package:flight_booking/Screens/ScreenHome/Providers/ChoiceProvider.dart';
import 'package:flight_booking/Screens/ScreenHome/Widgets/CustomChip.dart';
import 'package:flight_booking/Screens/ScreenHome/Widgets/FromToColumn.dart';
import 'package:flight_booking/Screens/ScreenHome/Widgets/drop_menu.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InputsWidget extends StatelessWidget {
  const InputsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // final width = MediaQuery.of(context).size.width;
    // final height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
      child: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const FromToColumn(cityCode: 'DXB', cityName: "Dubai"),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.swap_horizontal_circle_outlined),
                iconSize: 30,
              ),
              const FromToColumn(cityCode: "COK", cityName: 'Kochi'),
            ],
          ),
          const SizedBox(height: 30),
          Consumer<ChoiceProvider>(builder: (context, choice, _) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomChip(
                  title: "One Way",
                  isSelected: choice.isOneWay,
                  color: choice.isOneWay
                      ? Colors.lightBlue
                      : AppColor.customBlue.withOpacity(0.85),
                  onSelected: (value) {
                    if (choice.isOneWay) {
                    } else {
                      choice.changeValue(true);
                    }
                  },
                ),
                CustomChip(
                  title: "Round Trip",
                  isSelected: !choice.isOneWay,
                  color: choice.isOneWay
                      ? AppColor.customBlue.withOpacity(0.85)
                      : Colors.lightBlue,
                  onSelected: (value) {
                    if (!choice.isOneWay) {
                    } else {
                      choice.changeValue(false);
                    }
                  },
                ),
              ],
            );
          }),
          Card(
            surfaceTintColor: Colors.white,
            elevation: 5,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 15.0,
                      horizontal: 13,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Departure",
                          style: TextStyle(
                            color: AppColor.customBlue,
                            fontWeight: FontWeight.w800,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 8),
                        DatePicker(
                          helperText: "03-March-2024 Sunday",
                          label: "Select Trip*",
                          iconData: Icons.calendar_month,
                          width: null,
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const ScreenCalendar(),
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 8),
                        const DropMenu3(
                          label: "Select Trip*",
                          iconData: Icons.expand_more_sharp,
                          width: double.infinity,
                        ),
                      ],
                    ),
                  ),
                  Visibility(
                    visible: !Provider.of<ChoiceProvider>(context).isOneWay,
                    child: Column(
                      children: [
                        Divider(
                          color: Colors.grey[300],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 2,
                            horizontal: 13,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Return",
                                style: TextStyle(
                                  color: AppColor.customBlue,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(height: 8),
                              DatePicker(
                                helperText: "03-March-2024 Sunday",
                                label: "Select Trip*",
                                iconData: Icons.calendar_month,
                                width: null,
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const ScreenCalendar(),
                                    ),
                                  );
                                },
                              ),
                              const SizedBox(height: 18),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 23),
          Container(
            width: double.infinity,
            height: 53,
            decoration: BoxDecoration(
              color: AppColor.customBlue,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Center(
              child: Text(
                "Search Flights",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.white.withOpacity(0.9),
                  fontSize: 16,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
