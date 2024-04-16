import 'package:flight_booking/Models/FlightDataModel/AirlineDetails.dart';
import 'package:flight_booking/Models/FlightDataModel/AirportDetails.dart';
import 'package:flight_booking/Models/FlightDataModel/ArilineSegments.dart';
import 'package:flight_booking/Models/FlightDataModel/proposals.dart';
import 'package:json_annotation/json_annotation.dart';
part 'FlightDataModel.g.dart';

@JsonSerializable()
class FlightDataModel {
  @JsonKey(name: 'proposals')
  List<Proposals>? proposals;
  @JsonKey(name: 'airlines')
  Map<String, dynamic>? airlines;
  @JsonKey(name: 'segments')
  List<AirlineSegments>? segments;
  Map<String, dynamic>? airports;
  int? numberOfProposal = 0;

  FlightDataModel({
    this.airlines,
    this.proposals,
    this.segments,
    this.airports,
    this.numberOfProposal,
  });

  factory FlightDataModel.fromJson(Map<String, dynamic> json) =>
      _$FlightDataModelFromJson(json);
}
