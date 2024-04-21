import 'package:flight_booking/models/flight_data_model/airline_details.dart';
import 'package:flight_booking/models/flight_data_model/airport_details.dart';
import 'package:flight_booking/models/flight_data_model/airline_segments.dart';
import 'package:flight_booking/models/flight_data_model/proposals.dart';
import 'package:json_annotation/json_annotation.dart';
part 'flight_data_model.g.dart';

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
