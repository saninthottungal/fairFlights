import 'package:flight_booking/models/flight_data_model/airline_details.dart';
import 'package:flight_booking/models/flight_data_model/airport_details.dart';
import 'package:flight_booking/models/flight_data_model/flight_data_model.dart';
import 'package:flight_booking/models/flight_data_model/proposals.dart';
import 'package:flight_booking/providers/flight_providers/data_loading_provider.dart';
import 'package:flutter/material.dart';
import 'package:flight_booking/core/constants/enums.dart';
import 'package:flight_booking/models/flight_search_post_model/flight_search_post_model.dart';
import 'package:flight_booking/models/flight_search_post_model/passengers.dart';
import 'package:flight_booking/models/flight_search_post_model/segment.dart';
import 'package:flight_booking/providers/calendar_provider/calendar_provider.dart';
import 'package:flight_booking/providers/home_providers/counter_provider.dart';
import 'package:flight_booking/providers/home_providers/from_to_provider.dart';
import 'package:flight_booking/providers/home_providers/traveller_class_provider.dart';
import 'package:flight_booking/providers/home_providers/trip_chip_provider.dart';
import 'package:flight_booking/services/api/flight_search/flight_search.dart';
import 'package:flight_booking/services/connectivty/check_connectivty.dart';
import 'package:flight_booking/services/exception/network_exceptions.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class FlightDataProvider extends ChangeNotifier {
  List<FlightDataModel> flightDatas = [];
  List<Proposals> proposals = [];
  Map<String, AirlineDetails> airlines = {};
  Map<String, AirportDetails> airports = {};
  String? searchId;

  String loadingText = '';
  int numberOfProposals = 0;

  set setLoadingText(String text) {
    loadingText = text;
    notifyListeners();
  }

  void sortFlights(SortValues value) {
    switch (value) {
      case SortValues.none:
        proposals
            .sort((a, b) => a.segmentsRating!.compareTo(b.segmentsRating!));
        notifyListeners();
        break;
      case SortValues.cheapestFirst:
        proposals.sort(((a, b) => a.terms!.cost!.unifiedPrice!
            .compareTo(b.terms!.cost!.unifiedPrice!)));
        notifyListeners();
        break;

      case SortValues.tripDuration:
        proposals.sort((a, b) => a.totalDuration!.compareTo(b.totalDuration!));
        notifyListeners();
        break;
      case SortValues.rating:
        proposals
            .sort((a, b) => a.segmentsRating!.compareTo(b.segmentsRating!));
        notifyListeners();
        break;
      case SortValues.departureTime:
        proposals.sort((a, b) => a
            .segment!.first.flight!.first.departureTimestamp!
            .toInt()
            .compareTo(
                b.segment!.first.flight!.first.departureTimestamp!.toInt()));
        notifyListeners();
        break;
      case SortValues.arrivalTime:
        proposals.sort((a, b) => a.segment!.last.flight!.last.arrivalTimestamp!
            .toInt()
            .compareTo(b.segment!.last.flight!.last.arrivalTimestamp!.toInt()));
        notifyListeners();
        break;
    }
  }

  Future<String?> getFlightData(BuildContext context) async {
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
    final dataLoadingProvider =
        Provider.of<DataLoadingProvider>(context, listen: false);

    final marker = dotenv.env['API_MARKER'];
    List<Map<String, dynamic>> flightList;
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
    setLoadingText = 'Getting Ip Address...';
    try {
      userIp = await CheckNetConnectivity().getIpAddress();
    } on Network404Exception {
      dataLoadingProvider.setExceptionThrown = true;
      return "Network connection Lost.";
    } on GenericException {
      dataLoadingProvider.setExceptionThrown = true;
      return '';
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
      dataLoadingProvider.setExceptionThrown = true;
      return "couldn't load app components.";
    }
    if (passengers.adults == null ||
        passengers.children == null ||
        passengers.infants == null) {
      dataLoadingProvider.setExceptionThrown = true;
      return "passengers details not found.";
    }
    if (segments.isEmpty || segments.length > 2) {
      dataLoadingProvider.setExceptionThrown = true;
      return "Internal Error, contact dev.";
    }
    if (userIp == null) {
      dataLoadingProvider.setExceptionThrown = true;
      return "Could't fetch IP Address, try again later.";
    }
    if (apiKey == null) {
      dataLoadingProvider.setExceptionThrown = true;
      return "couldn't load app components.";
    }

    try {
      setLoadingText = 'Sending request...';
      searchId = await flightSearch.postRequest();
      setLoadingText = 'searching the best flights for you...';
      flightList = await flightSearch.getRequest(searchId);
    } on Network404Exception {
      dataLoadingProvider.setExceptionThrown = true;
      return "Network connection Lost.";
    } on SignatureFormationException {
      dataLoadingProvider.setExceptionThrown = true;
      return "couldn't load app components.";
    } on SearchIdNotFoundException {
      dataLoadingProvider.setExceptionThrown = true;
      return "couldn't form a request. try later.";
    } on DioRequestException {
      dataLoadingProvider.setExceptionThrown = true;
      return "Network connection timed out.";
    } on GenericException {
      dataLoadingProvider.setExceptionThrown = true;
      return "Internal Error, contact dev.";
    }

    flightDatas = flightList.map((element) {
      return FlightDataModel.fromJson(element);
    }).toList();

    for (var flightData in flightDatas) {
      if (flightData.airlines != null) {
        for (var entry in flightData.airlines!.entries) {
          airlines[entry.key] = entry.value as AirlineDetails;
        }
      }
    }

    for (var flightData in flightDatas) {
      if (flightData.airports != null) {
        for (var entry in flightData.airports!.entries) {
          airports[entry.key] = entry.value as AirportDetails;
        }
      }
    }

    proposals = flightDatas.fold<List<Proposals>>([], (previousValue, element) {
      previousValue.addAll(element.proposals as Iterable<Proposals>);
      return previousValue;
    });

    numberOfProposals = proposals.length;

    dataLoadingProvider.setIsLoading = false;
    await Future.delayed(Durations.medium1);
    setLoadingText = ' ';
    notifyListeners();
    return null;
  }

  String formatDateSegment(DateTime dateTime) {
    return DateFormat('yyyy-MM-dd').format(dateTime);
  }
}
