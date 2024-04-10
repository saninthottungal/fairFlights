import 'package:flight_booking/Core/Constants/enums.dart';
import 'package:flight_booking/Models/FlightDataModel/proposals.dart';

class FlightModel {
  String? departureTime;
  String? departure;
  String? arrivalTime;
  String? arrival;
  String? maxStops;
  bool isDirect = false;
  String? layoverTime;
  String? duration;

  FlightModel(
    this.arrival,
    this.arrivalTime,
    this.departure,
    this.departureTime,
    this.duration,
    this.isDirect,
    this.layoverTime,
    this.maxStops,
  );

  factory FlightModel.fromFlightDataModel({
    required Proposals proposal,
    required TripType tripType,
    required TripWay tripWay,
  }) {
    final segment =
        tripType == TripType.oneWay || tripWay == TripWay.departureWay
            ? proposal.segment?.first
            : proposal.segment?.last;
    final departureTime = segment?.flight?.first.departureTime;

    final departure = segment?.flight?.first.departure;

    final arrivalTime = segment?.flight?.last.arrivalTime;
    final arrival = segment?.flight?.last.arrival;
    bool isDirect = false;
    String? maxStops;
    String? layoverTime;
    String? duration = '';

    if (segment != null) {
      var durationInMinutes =
          tripType == TripType.oneWay || tripWay == TripWay.departureWay
              ? proposal.segmentDurations!.first
              : proposal.segmentDurations!.last;
      duration = (durationInMinutes / 60).toStringAsFixed(1);
    }

    if (segment?.transfers?.first.durationSeconds != null) {
      var layoverTimeInMinutes = segment!.flight!.last.delay!;
      layoverTime = (layoverTimeInMinutes / 60).toStringAsFixed(1);
    }
    if (proposal.isDirect != null) {
      isDirect = proposal.isDirect!;
      if (isDirect || layoverTime == null) {
        maxStops = 'Direct';
      } else {
        maxStops = '${proposal.maxStops} layovers';
      }
    }

    return FlightModel(
      arrival,
      arrivalTime,
      departure,
      departureTime,
      duration,
      isDirect,
      layoverTime,
      maxStops,
    );
  }
}
