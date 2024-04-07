import 'package:flight_booking/Models/FlightDataModel/AirlineDetails.dart';
import 'package:json_annotation/json_annotation.dart';
part 'Airline.g.dart';

@JsonSerializable()
class Airline {
  @JsonKey(name: 'details')
  AirlineDetails? details;
  Airline({this.details});

  factory Airline.fromJson(Map<String, dynamic> json) =>
      _$AirlineFromJson(json);
}
