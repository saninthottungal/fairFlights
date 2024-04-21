// ignore_for_file: use_build_context_synchronously

import 'package:flight_booking/core/constants/colors.dart';
import 'package:flight_booking/core/constants/enums.dart';
import 'package:flight_booking/core/widgets/custom_snack_bar.dart';
import 'package:flight_booking/providers/calendar_provider/calendar_provider.dart';
import 'package:flight_booking/providers/flight_providers/data_loading_provider.dart';
import 'package:flight_booking/providers/flight_providers/flight_data_provider.dart';
import 'package:flight_booking/providers/flight_providers/sort_provider.dart';
import 'package:flight_booking/providers/home_providers/from_to_provider.dart';
import 'package:flight_booking/providers/home_providers/traveller_class_provider.dart';
import 'package:flight_booking/providers/home_providers/trip_chip_provider.dart';
import 'package:flight_booking/screens/screen_home/Widgets/custom_card.dart';
import 'package:flight_booking/screens/screen_home/Widgets/custom_chip.dart';
import 'package:flight_booking/screens/screen_home/Widgets/from_to_column.dart';
import 'package:flight_booking/screens/screen_home/Widgets/modale_container.dart';
import 'package:flight_booking/services/connectivty/check_connectivty.dart';
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
                    Navigator.of(context).pushNamed('/search');
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
                    Navigator.of(context).pushNamed('/search');
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
                              Navigator.of(context).pushNamed('/calendar');
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
                                    return SingleChildScrollView(
                                      child: ModaleContainer(
                                        ctx: ctx,
                                      ),
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
                                    Navigator.of(context)
                                        .pushNamed('/calendar');
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
            onPressed: () async {
              final dataProvider =
                  Provider.of<FlightDataProvider>(context, listen: false);
              final dataLoadingProvider =
                  Provider.of<DataLoadingProvider>(context, listen: false);
              final sortProvider =
                  Provider.of<SortProvider>(context, listen: false);

              dataProvider.flightDatas.clear();
              dataLoadingProvider.isLoading = true;
              sortProvider.selectedGroupValue = SortValues.none;
              dataLoadingProvider.setExceptionThrown = false;
              if (!await CheckNetConnectivity().checknetConnectivity()) {
                CustomSnackbar.show(
                    context: context, message: "No network connection!");
                return;
              }
              Navigator.of(context).pushNamed('/flightsList');

              String? message = await dataProvider.getFlightData(context);
              if (message != null) {
                CustomSnackbar.show(context: context, message: message);
              }
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
