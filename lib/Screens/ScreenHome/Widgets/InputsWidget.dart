import 'package:flight_booking/Core/Constants/colors.dart';
import 'package:flight_booking/Core/Constants/enums.dart';
import 'package:flight_booking/Providers/CalendarProvider/CalendarProvider.dart';
import 'package:flight_booking/Providers/HomeProviders/FromToProvider.dart';
import 'package:flight_booking/Providers/HomeProviders/TravellerClassProvider.dart';
import 'package:flight_booking/Providers/HomeProviders/TripChipProvider.dart';
import 'package:flight_booking/Screens/ScreenCalendar/ScreenCalendar.dart';
import 'package:flight_booking/Screens/ScreenFlights/ScreenFlights.dart';
import 'package:flight_booking/Screens/ScreenHome/Widgets/CustomCard.dart';
import 'package:flight_booking/Screens/ScreenHome/Widgets/CustomChip.dart';
import 'package:flight_booking/Screens/ScreenHome/Widgets/FromToColumn.dart';
import 'package:flight_booking/Screens/ScreenHome/Widgets/ModaleContainer.dart';
import 'package:flight_booking/Screens/ScreenSearch/ScreenSearch.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class InputsWidget extends StatelessWidget {
  InputsWidget({super.key});

  final List<dynamic> flightResults = [];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30, left: 10, right: 10),
      child: ListView(
        children: [
          Consumer<FromToProvider>(builder: (context, fromToProvider, _) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () async {
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
                  onPressed: () async {
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
                        Consumer<CalendarProvider>(
                            builder: (context, provider, _) {
                          final date = formatDate(provider.departureDate);
                          return CustomCard(
                            title: date,
                            onTap: () {
                              final provider = Provider.of<CalendarProvider>(
                                  context,
                                  listen: false);
                              provider.way = TripWay.departureWay;
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const ScreenCalendar(),
                                ),
                              );
                            },
                          );
                        }),
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
                        Consumer<TravellerClassProvider>(
                            builder: (context, provider, _) {
                          final travellers =
                              "${provider.travellerCount} Travellers";
                          String classType = 'Economy';
                          switch (provider.classType) {
                            case ClassType.buissness:
                              classType = 'Buissness';
                              break;
                            case ClassType.economy:
                              classType = 'Economy';
                              break;
                            case ClassType.premiumEconomy:
                              classType = 'Premium Economy';
                              break;
                            case ClassType.firstClass:
                              classType = 'First Class';
                              break;
                          }
                          return CustomCard(
                            title: '$travellers/$classType',
                            onTap: () {
                              showModalBottomSheet(
                                  isScrollControlled: true,
                                  context: context,
                                  builder: (ctx) {
                                    return const SingleChildScrollView(
                                      child: ModaleContainer(),
                                    );
                                  });
                            },
                          );
                        })
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
                                  onTap: () {
                                    final provider =
                                        Provider.of<CalendarProvider>(context,
                                            listen: false);
                                    provider.way = TripWay.returnWay;
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const ScreenCalendar()));
                                  },
                                  title: Consumer<CalendarProvider>(
                                      builder: (context, provider, _) {
                                    final date =
                                        formatDate(provider.returnDate);
                                    return Text(
                                      date,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black54,
                                        fontSize: 15,
                                      ),
                                    );
                                  }),
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
          CupertinoButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const ScreenFlights()));
            },
            color: const Color.fromARGB(255, 26, 52, 192),
            pressedOpacity: 0.9,
            child: const Text("Search Flights"),
          ),
        ],
      ),
    );
  }

  String formatDate(DateTime dateTime) {
    final DateFormat formatter = DateFormat('dd MMMM, EEEEEE');
    return formatter.format(dateTime).toLowerCase();
  }
}
