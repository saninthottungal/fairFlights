// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'segment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Segment _$SegmentFromJson(Map<String, dynamic> json) => Segment(
      origin: json['origin'] as String?,
      destination: json['destination'] as String?,
      date: json['date'] as String?,
    );

Map<String, dynamic> _$SegmentToJson(Segment instance) => <String, dynamic>{
      'origin': instance.origin,
      'destination': instance.destination,
      'date': instance.date,
    };
