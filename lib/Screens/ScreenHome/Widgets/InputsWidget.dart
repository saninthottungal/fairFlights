import 'package:flight_booking/Core/Constants/colors.dart';
import 'package:flight_booking/Core/Constants/enums.dart';
import 'package:flight_booking/Providers/HomeProviders/FromToProvider.dart';
import 'package:flight_booking/Providers/HomeProviders/TripChipProvider.dart';
import 'package:flight_booking/Screens/ScreenCalendar/ScreenCalendar.dart';
import 'package:flight_booking/Screens/ScreenHome/Widgets/CustomCard.dart';
import 'package:flight_booking/Screens/ScreenHome/Widgets/CustomChip.dart';
import 'package:flight_booking/Screens/ScreenHome/Widgets/FromToColumn.dart';
import 'package:flight_booking/Screens/ScreenHome/Widgets/ModaleContainer.dart';
import 'package:flight_booking/Screens/ScreenSearch/ScreenSearch.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
      padding: const EdgeInsets.only(top: 30, left: 10, right: 10),
      child: ListView(
        children: [
          Consumer<FromToProvider>(builder: (context, fromToProvider, _) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ScreenSearch()));
                  },
                  child: FromToColumn(
                    cityCode: fromToProvider.from.code ?? 'DXB',
                    cityName: fromToProvider.from.countryName ??
                        "United Arab Emirates",
                  ),
                ),
                IconButton(
                  onPressed: () {
                    final provider =
                        Provider.of<FromToProvider>(context, listen: false);
                    final tempFrom = provider.from;
                    provider.changeFromValue = provider.to;
                    provider.changeToValue = tempFrom;
                  },
                  icon: const Icon(Icons.swap_horizontal_circle_outlined),
                  iconSize: 30,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ScreenSearch()));
                  },
                  child: FromToColumn(
                    cityCode: fromToProvider.to.code ?? "COK",
                    cityName: fromToProvider.to.countryName ?? "Kochi",
                  ),
                ),
              ],
            );
          }),
          const SizedBox(height: 20),
          Consumer<TripChipProvider>(builder: (context, choice, _) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomChip(
                  title: "One Way",
                  value: TripType.oneWay,
                  groupValue: choice.value,
                  onSelected: (value) {
                    choice.changeValue(TripType.oneWay);
                  },
                  selectedColor: Colors.lightBlue,
                  disabledColor: AppColor.customBlue.withOpacity(0.85),
                ),
                CustomChip(
                  title: "Round Trip",
                  value: TripType.roundTrip,
                  groupValue: choice.value,
                  onSelected: (value) {
                    choice.changeValue(TripType.roundTrip);
                  },
                  selectedColor: Colors.lightBlue,
                  disabledColor: AppColor.customBlue.withOpacity(0.85),
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
                        const Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text(
                            "Select Date",
                            style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                            ),
                          ),
                        ),
                        CustomCard(
                          title: "16 Mar, Fri",
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => ScreenCalendar()));
                          },
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 10, top: 8),
                          child: Text(
                            "Traveller/Class",
                            style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.bold,
                                fontSize: 13),
                          ),
                        ),
                        CustomCard(
                          title: "1 Traveller/Economy",
                          onTap: () {
                            showModalBottomSheet(
                                isScrollControlled: true,
                                context: context,
                                builder: (ctx) {
                                  return const SingleChildScrollView(
                                      child: ModaleContainer());
                                });
                          },
                        )
                      ],
                    ),
                  ),
                  Visibility(
                    visible: Provider.of<TripChipProvider>(context).value ==
                        TripType.roundTrip,
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
                              const Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: Text(
                                  "Select Date",
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                              Card(
                                child: CupertinoListTile(
                                  onTap: () {},
                                  title: const Text(
                                    "16 Mar, Fri",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black54,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
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
