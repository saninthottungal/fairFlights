// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flight_search_post_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FlightSearchPostModel _$FlightSearchPostModelFromJson(
        Map<String, dynamic> json) =>
    FlightSearchPostModel(
      signature: json['signature'] as String?,
      marker: json['marker'] as String?,
      userIp: json['user_ip'] as String?,
      tripClass: json['trip_class'] as String?,
      passengers: json['passengers'] == null
          ? null
          : Passengers.fromJson(json['passengers'] as Map<String, dynamic>),
      segments: (json['segments'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : Segment.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..host = json['host'] as String?
      ..locale = json['locale'] as String?
      ..currency = json['currency'] as String?;

Map<String, dynamic> _$FlightSearchPostModelToJson(
        FlightSearchPostModel instance) =>
    <String, dynamic>{
      'signature': instance.signature,
      'marker': instance.marker,
      'host': instance.host,
      'user_ip': instance.userIp,
      'locale': instance.locale,
      'trip_class': instance.tripClass,
      'passengers': instance.passengers,
      'segments': instance.segments,
      'currency': instance.currency,
    };
