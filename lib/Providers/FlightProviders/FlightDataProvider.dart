import 'package:flight_booking/Models/FlightDataModel/flight_data_model.dart';
import 'package:flutter/material.dart';
import 'package:flight_booking/Core/Constants/enums.dart';
import 'package:flight_booking/Models/FlightSearchPostModel/FlightSearchPostModel.dart';
import 'package:flight_booking/Models/FlightSearchPostModel/passengers.dart';
import 'package:flight_booking/Models/FlightSearchPostModel/segment.dart';
import 'package:flight_booking/Providers/CalendarProvider/CalendarProvider.dart';
import 'package:flight_booking/Providers/HomeProviders/CounterProvider.dart';
import 'package:flight_booking/Providers/HomeProviders/FromToProvider.dart';
import 'package:flight_booking/Providers/HomeProviders/TravellerClassProvider.dart';
import 'package:flight_booking/Providers/HomeProviders/TripChipProvider.dart';
import 'package:flight_booking/Services/Api/FlightSearch/FlightSearch.dart';
import 'package:flight_booking/Services/Connectivty/CheckConnectivty.dart';
import 'package:flight_booking/Services/Exception/NetworkExceptions.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class FlightDataProvider extends ChangeNotifier {
  List<FlightDataModel> flightDatas = [];
  bool isLoading = true;

  Future<List<Map<String, dynamic>>> getFlightData(BuildContext context) async {
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
    isLoading = false;
    await Future.delayed(Durations.medium1);
    notifyListeners();
    return flightList;
  }

  String formatDateSegment(DateTime dateTime) {
    return DateFormat('yyyy-MM-dd').format(dateTime);
  }
}
