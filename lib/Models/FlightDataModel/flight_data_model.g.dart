// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flight_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FlightDataModel _$FlightDataModelFromJson(Map<String, dynamic> json) =>
    FlightDataModel(
      airlines: json['airlines'] == null
          ? null
          : Airline.fromJson(json['airlines'] as Map<String, dynamic>),
      proposals: (json['proposals'] as List<dynamic>?)
          ?.map((e) => Proposals.fromJson(e as Map<String, dynamic>))
          .toList(),
      segments: (json['segments'] as List<dynamic>?)
          ?.map((e) => AirlineSegments.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FlightDataModelToJson(FlightDataModel instance) =>
    <String, dynamic>{
      'proposals': instance.proposals,
      'airlines': instance.airlines,
      'segments': instance.segments,
    };
