// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'proposals.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Proposals _$FlightDataModelFromJson(Map<String, dynamic> json) => Proposals(
      terms: json['terms'] == null
          ? null
          : Terms.fromJson(json['terms'] as Map<String, dynamic>),
      segment: (json['segment'] as List<dynamic>?)
          ?.map((e) => Segment.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalDuration: json['total_duration'] as num?,
      stopsAirports: (json['stops_airports'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      maxStops: json['max_stops'] as num?,
      carriers: (json['carriers'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      segmentDurations: (json['segment_durations'] as List<dynamic>?)
          ?.map((e) => e as num)
          .toList(),
      segmentsAirports: (json['segments_airports'] as List<dynamic>?)
          ?.map((e) => (e as List<dynamic>).map((e) => e as String).toList())
          .toList(),
      isDirect: json['is_direct'] as bool?,
      segmentsRating: (json['segments_rating'] as num?)?.toDouble(),
    );
