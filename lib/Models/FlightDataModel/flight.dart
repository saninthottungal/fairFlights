import 'package:json_annotation/json_annotation.dart';

part 'flight.g.dart';

@JsonSerializable()
class Flight {
  String? aircraft;
  String? arrival;
  @JsonKey(name: 'arrival_date')
  String? arrivalDate;
  @JsonKey(name: 'arrival_time')
  String? arrivalTime;
  @JsonKey(name: 'arrival_timestamp')
  num? arrivalTimestamp;
  num? delay;
  String? departure;
  @JsonKey(name: 'departure_date')
  String? departureDate;
  @JsonKey(name: 'departure_time')
  String? departureTime;
  @JsonKey(name: 'departure_timestamp')
  num? departureTimestamp;
  num? duration;
  String? equipment;
  @JsonKey(name: 'local_arrival_timestamp')
  num? localArrivalTimestamp;
  @JsonKey(name: 'local_departure_timestamp')
  num? localDepartureTimestamp;
  @JsonKey(name: 'marketing_carrier')
  String? marketingCarrier;
  String? number;
  @JsonKey(name: 'operating_carrier')
  String? operatingCarrier;
  @JsonKey(name: 'operated_by')
  String? operatedBy;
  num? rating;
  @JsonKey(name: 'technical_stops')
  dynamic technicalStops;
  @JsonKey(name: 'trip_class')
  String? tripClass;

  Flight({
    this.aircraft,
    this.arrival,
    this.arrivalDate,
    this.arrivalTime,
    this.arrivalTimestamp,
    this.delay,
    this.departure,
    this.departureDate,
    this.departureTime,
    this.departureTimestamp,
    this.duration,
    this.equipment,
    this.localArrivalTimestamp,
    this.localDepartureTimestamp,
    this.marketingCarrier,
    this.number,
    this.operatingCarrier,
    this.operatedBy,
    this.rating,
    this.technicalStops,
    this.tripClass,
  });

  factory Flight.fromJson(Map<String, dynamic> json) {
    return _$FlightFromJson(json);
  }

  Map<String, dynamic> toJson() => _$FlightToJson(this);
}
