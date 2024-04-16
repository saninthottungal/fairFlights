import 'package:flight_booking/Models/FlightDataModel/AirlineDetails.dart';
import 'package:flight_booking/Models/FlightDataModel/ArilineSegments.dart';
import 'package:flight_booking/Models/FlightDataModel/proposals.dart';
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
  int? numberOfProposal = 0;

  FlightDataModel({
    this.airlines,
    this.proposals,
    this.segments,
    this.numberOfProposal,
  });

  factory FlightDataModel.fromJson(Map<String, dynamic> json) =>
      _$FlightDataModelFromJson(json);
}
