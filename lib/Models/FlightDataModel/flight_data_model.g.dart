// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flight_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FlightDataModel _$FlightDataModelFromJson(Map<String, dynamic> json) {
  final tempProposals = (json['proposals'] as List<dynamic>?);
  final proposals = tempProposals?.map((e) {
    return Proposals.fromJson(e as Map<String, dynamic>);
  }).toList();

  return FlightDataModel(
      airlines: json['airlines'] == null
          ? null
          : Airline.fromJson(json['airlines'] as Map<String, dynamic>),
      proposals: proposals,
      segments: (json['segments'] as List<dynamic>?)
          ?.map((e) => AirlineSegments.fromJson(e as Map<String, dynamic>))
          .toList(),
      numberOfProposal: tempProposals?.length);
}

Map<String, dynamic> _$FlightDataModelToJson(FlightDataModel instance) =>
    <String, dynamic>{
      'proposals': instance.proposals,
      'airlines': instance.airlines,
      'segments': instance.segments,
    };
