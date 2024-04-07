// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ArilineSegments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AirlineSegments _$AirlineSegmentsFromJson(Map<String, dynamic> json) =>
    AirlineSegments(
      date: json['date'] as String?,
      destination: json['destination'] as String?,
      origin: json['origin'] as String?,
      originalDestination: json['original_destination'] as String?,
      originalOrigin: json['original_origin'] as String?,
    );

Map<String, dynamic> _$AirlineSegmentsToJson(AirlineSegments instance) =>
    <String, dynamic>{
      'origin': instance.origin,
      'original_origin': instance.originalOrigin,
      'destination': instance.destination,
      'original_destination': instance.originalDestination,
      'date': instance.date,
    };
