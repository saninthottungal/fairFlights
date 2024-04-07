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
      isCharter: json['is_charter'] as bool?,
      maxStops: json['max_stops'] as num?,
      maxStopDuration: json['max_stop_duration'] as num?,
      minStopDuration: json['min_stop_duration'] as num?,
      carriers: (json['carriers'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      segmentDurations: (json['segment_durations'] as List<dynamic>?)
          ?.map((e) => e as num)
          .toList(),
      segmentsTime: (json['segments_time'] as List<dynamic>?)
          ?.map((e) => (e as List<dynamic>).map((e) => e as num).toList())
          .toList(),
      segmentsAirports: (json['segments_airports'] as List<dynamic>?)
          ?.map((e) => (e as List<dynamic>).map((e) => e as String).toList())
          .toList(),
      sign: json['sign'] as String?,
      isDirect: json['is_direct'] as bool?,
      flightWeight: (json['flight_weight'] as num?)?.toDouble(),
      popularity: json['popularity'] as num?,
      segmentsRating: (json['segments_rating'] as num?)?.toDouble(),
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      validatingCarrier: json['validating_carrier'] as String?,
    );

Map<String, dynamic> _$FlightDataModelToJson(Proposals instance) =>
    <String, dynamic>{
      'terms': instance.terms,
      'segment': instance.segment,
      'total_duration': instance.totalDuration,
      'stops_airports': instance.stopsAirports,
      'is_charter': instance.isCharter,
      'max_stops': instance.maxStops,
      'max_stop_duration': instance.maxStopDuration,
      'min_stop_duration': instance.minStopDuration,
      'carriers': instance.carriers,
      'segment_durations': instance.segmentDurations,
      'segments_time': instance.segmentsTime,
      'segments_airports': instance.segmentsAirports,
      'sign': instance.sign,
      'is_direct': instance.isDirect,
      'flight_weight': instance.flightWeight,
      'popularity': instance.popularity,
      'segments_rating': instance.segmentsRating,
      'tags': instance.tags,
      'validating_carrier': instance.validatingCarrier,
    };
