import 'package:flight_booking/Core/Constants/enums.dart';
import 'package:flight_booking/Models/FlightSearchPostModel/FlightSearchPostModel.dart';
import 'package:flight_booking/Models/FlightSearchPostModel/passengers.dart';
import 'package:flight_booking/Models/FlightSearchPostModel/segment.dart';
import 'package:flight_booking/Providers/CalendarProvider/CalendarProvider.dart';
import 'package:flight_booking/Providers/HomeProviders/CounterProvider.dart';
import 'package:flight_booking/Providers/HomeProviders/FromToProvider.dart';
import 'package:flight_booking/Providers/HomeProviders/TravellerClassProvider.dart';
import 'package:flight_booking/Providers/HomeProviders/TripChipProvider.dart';
import 'package:flight_booking/Screens/ScreenFlights/Widgets/AppBar.dart';
import 'package:flight_booking/Services/Api/FlightSearch/FlightSearch.dart';
import 'package:flight_booking/Services/Connectivty/CheckConnectivty.dart';
import 'package:flight_booking/Services/Exception/NetworkExceptions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class ScreenFlights extends StatelessWidget {
  const ScreenFlights({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return FutureBuilder(
        future: getFlightData(context),
        builder: (BuildContext ctx, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return const Scaffold(
                body: Center(
                  child: Text("Internal Error"),
                ),
              );
            case ConnectionState.waiting:
              return Scaffold(
                body: Center(
                  child: Column(
                    children: [
                      LottieBuilder.asset(
                        'assets/loading.json',
                        height: height * 0.7,
                        width: width * 0.7,
                      ),
                      Text(
                        "Finding best Flights for you...",
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.8),
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            case ConnectionState.active:
              return Scaffold(
                body: Center(
                  child: Column(
                    children: [
                      LottieBuilder.asset(
                        'assets/loading.json',
                        height: height * 0.7,
                        width: width * 0.7,
                      ),
                      Text(
                        "Finding best Flights for you...",
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.8),
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            case ConnectionState.done:
              if (snapshot.hasError) {
                if (snapshot.error is Network404Exception) {
                  return Scaffold(
                    body: Center(
                      child: Text('network error'),
                    ),
                  );
                } else {
                  print(snapshot.error);
                  return Scaffold(
                    body: Center(
                      child: Text('not network error'),
                    ),
                  );
                }
              } else {
                return Scaffold(
                    appBar: CustomAppBar(
                      onPressed: () async {
                        showModalBottomSheet(
                            context: context,
                            builder: (ctx) {
                              return SizedBox(
                                height: height * 0.5,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    const Text("Sort"),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text("Cheapest First"),
                                        Radio(
                                            value: true,
                                            groupValue: true,
                                            onChanged: (value) {})
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text("Trip Duration"),
                                        Radio(
                                            value: true,
                                            groupValue: true,
                                            onChanged: (value) {})
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text("Rating"),
                                        Radio(
                                            value: true,
                                            groupValue: true,
                                            onChanged: (value) {})
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text("Departure Time"),
                                        Radio(
                                            value: true,
                                            groupValue: true,
                                            onChanged: (value) {})
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text("Arrival Time"),
                                        Radio(
                                            value: true,
                                            groupValue: true,
                                            onChanged: (value) {})
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            });
                      },
                    ),
                    body: SafeArea(
                      child: Column(
                        children: [
                          Flexible(
                            flex: 1,
                            child: Row(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(left: 10, top: 10),
                                  child: RotatedBox(
                                    quarterTurns: 3,
                                    child: Text(
                                      "MAR",
                                    ),
                                  ),
                                ),
                                const VerticalDivider(width: 20, indent: 10),
                                Expanded(
                                  flex: 1,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    //shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.only(
                                            top: 10,
                                            left: 5,
                                            right: 5,
                                            bottom: 5),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            border: index == 1
                                                ? const BorderDirectional(
                                                    bottom: BorderSide(
                                                    color: Colors.blue,
                                                    width: 3,
                                                  ))
                                                : const Border(),
                                          ),
                                          width: 65,
                                          child: Column(
                                            children: [
                                              Text("Thu, $index"),
                                              Text(
                                                "\$48569",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: index == 1
                                                        ? Colors.lightBlue
                                                        : Colors.black),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                    itemCount: 20,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Divider(),
                          Flexible(
                            flex: 10,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: ListView.separated(
                                itemBuilder: (context, index) {
                                  return const SizedBox(
                                    height: 100,
                                    width: double.infinity,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        SizedBox(
                                          width: double.infinity,
                                          child: Text(
                                            "Air India, United Airlines",
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            CircleAvatar(),
                                            Column(
                                              children: [
                                                Text(
                                                  "07:15",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 18),
                                                ),
                                                Text("DEL"),
                                              ],
                                            ),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Text("24h 50m"),
                                                Divider(),
                                                Text("1 stop"),
                                              ],
                                            ),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Text(
                                                  "07:15",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 18),
                                                ),
                                                Text("DEL"),
                                              ],
                                            ),
                                            SizedBox(width: 15),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(bottom: 15),
                                              child: Text(
                                                "\$82705",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  );
                                },
                                separatorBuilder: (context, index) {
                                  return const Divider();
                                },
                                itemCount: 10,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ));
              }
          }
        });
  }

  Future<List> getFlightData(BuildContext context) async {
    final travellerClassProvider =
        Provider.of<TravellerClassProvider>(context, listen: false);
    final tripClass =
        travellerClassProvider.classType == ClassType.economy ? 'Y' : 'C';
    final counterProvider =
        Provider.of<CounterProvider>(context, listen: false);
    final tripProvider = Provider.of<TripChipProvider>(context, listen: false);
    final fromToProvider = Provider.of<FromToProvider>(context, listen: false);
    final calendarProvider =
        Provider.of<CalendarProvider>(context, listen: false);

    final marker = dotenv.env['API_MARKER'];
    String? searchId;
    List<dynamic> flightList;
    String? userIp;

    final passengers = Passengers(
      adults: counterProvider.adult,
      children: counterProvider.children,
      infants: counterProvider.infant,
    );

    final List<Segment> segments = [];
    final departureDate = formatDateSegment(calendarProvider.departureDate);
    final returnDate = formatDateSegment(calendarProvider.returnDate);
    final segment1 = Segment(
      origin: fromToProvider.from.code,
      destination: fromToProvider.to.code,
      date: departureDate,
    );
    final segment2 = Segment(
      origin: fromToProvider.to.code,
      destination: fromToProvider.from.code,
      date: returnDate,
    );
    if (tripProvider.value == TripType.oneWay) {
      segments.add(segment1);
    } else {
      segments.add(segment1);
      segments.add(segment2);
    }
    try {
      userIp = await CheckNetConnectivity().getIpAddress();
    } on Network404Exception {
      throw Network404Exception();
    } on GenericException {
      throw GenericException();
    }
    final postModel = FlightSearchPostModel(
      marker: marker,
      userIp: userIp,
      tripClass: tripClass,
      passengers: passengers,
      segments: segments,
    );

    final apiKey = dotenv.env['API_KEY'];

    final flightSearch = FlightSearch(
      postModel: postModel,
      apiKey: apiKey,
    );

    if (marker == null) {
      throw MarkerNotFoundException();
    }
    if (passengers.adults == null ||
        passengers.children == null ||
        passengers.infants == null) {
      throw PassengersNotFoundException();
    }
    if (segments.isEmpty || segments.length > 2) {
      throw SegmentsErrorException();
    }
    if (userIp == null) {
      throw UserIpNotFoundException();
    }
    if (apiKey == null) {
      ApiKeyNotFoundException();
    }

    try {
      searchId = await flightSearch.postRequest();
      flightList = await flightSearch.getRequest(searchId);
    } on Network404Exception {
      throw Network404Exception();
    } on SignatureFormationException {
      throw SignatureFormationException();
    } on SearchIdNotFoundException {
      throw SearchIdNotFoundException();
    } on DioRequestException {
      throw DioRequestException();
    } on GenericException {
      throw GenericException();
    }

    return flightList;
  }

  String formatDateSegment(DateTime dateTime) {
    return DateFormat('yyyy-MM-dd').format(dateTime);
  }
}
