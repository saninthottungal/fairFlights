import 'package:flight_booking/Models/FlightDataModel/AirlineDetails.dart';
import 'package:flight_booking/Models/FlightDataModel/AirportDetails.dart';
import 'package:flight_booking/Models/FlightDataModel/flight.dart';
import 'package:flight_booking/Providers/FlightProviders/FlightDataProvider.dart';
import 'package:intl/intl.dart';

class FlightModel {
  AirlineDetails? airline;
  AirportDetails? departure;
  AirportDetails? arrival;
  String? duration;
  String? departureTime;
  String? departureDate;
  String? arrivalTime;
  String? arrivalDate;
  DateTime? arrivalTimeAsDateTime;

  FlightModel({
    this.airline,
    this.arrival,
    this.arrivalDate,
    this.arrivalTime,
    this.departureDate,
    this.departureTime,
    this.duration,
    this.departure,
    this.arrivalTimeAsDateTime,
  });

  factory FlightModel.fromFlight({
    required Flight? flight,
    required FlightDataProvider flightDataProvider,
  }) {
    AirlineDetails? airline;
    AirportDetails? departure;
    AirportDetails? arrival;
    String? duration;
    String? departureTime;
    String? departureDate;
    String? arrivalTime;
    String? arrivalDate;
    DateTime? arrivalTimeAsDateTime;
    DateTime? arrivalDateAsDateTime;
    String formatDate(String date) {
      DateTime dateTime = DateTime.parse(date);
      arrivalDateAsDateTime = dateTime;
      String formattedDate = DateFormat('dd MMM, EEE').format(dateTime);
      return formattedDate;
    }

    String? formatTime(String? timeFromFlight) {
      if (timeFromFlight != null) {
        List<String> parts = timeFromFlight.split(':');
        int year = arrivalDateAsDateTime!.year;
        int month = arrivalDateAsDateTime!.month;
        int day = arrivalDateAsDateTime!.day;

        int hour = int.parse(parts[0]);
        int minute = int.parse(parts[1]);

        DateTime time = DateTime(year, month, day, hour, minute);
        //arrivaltimeasdatetime
        arrivalTimeAsDateTime = time;
        String formattedTime = DateFormat('hh:mm a').format(time);
        return formattedTime;
      } else {
        return null;
      }
    }

    if (flight != null) {
      //airline
      airline = flightDataProvider.airlines.entries
          .firstWhere((mapEntry) =>
              mapEntry.key ==
              (flight.operatingCarrier ?? flight.marketingCarrier))
          .value;
      //departure
      String? iata = flight.departure;
      if (iata != null) {
        departure = flightDataProvider.airports.entries
            .firstWhere((mapEntry) => mapEntry.key == iata)
            .value;
      }
      //arrival
      iata = flight.arrival;
      if (iata != null) {
        arrival = flightDataProvider.airports.entries
            .firstWhere((mapEntry) => mapEntry.key == iata)
            .value;
      }

      //arrivalDate
      String? date = flight.departureDate;
      if (date != null) {
        final formattedDate = formatDate(date);
        arrivalDate = formattedDate;
      }
      //arrivalTime
      arrivalTime = formatTime(
        flight.arrivalTime,
      );
      //duration
      var durationInMinutes = flight.duration!;
      duration = (durationInMinutes / 60).toStringAsFixed(1);
      //departureDate
      date = flight.departureDate;
      if (date != null) {
        final formattedDate = formatDate(date);
        departureDate = formattedDate;
      }
      //departureTime
      departureTime = formatTime(flight.departureTime);

      //airportNameArrival
      if (arrival!.name != null) {
        if (arrival.name!.length > 15) {
          arrival.name = arrival.name!.substring(0, 15);
        }
      }
      //airportNamedeparture
      if (departure!.name != null) {
        if (departure.name!.length > 15) {
          departure.name = departure.name!.substring(0, 15);
        }
      }
    }

    return FlightModel(
      airline: airline,
      arrival: arrival,
      arrivalDate: arrivalDate,
      arrivalTime: arrivalTime,
      departure: departure,
      departureDate: departureDate,
      departureTime: departureTime,
      duration: duration,
      arrivalTimeAsDateTime: arrivalTimeAsDateTime,
    );
  }
}
