// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'FlightSearchPostModel.dart';

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
    FlightSearchPostModel instance) {
  final passengers = instance.passengers?.toJson();
  final segments = instance.segments?.map((segment) {
    return segment?.toJson();
  }).toList();
  return <String, dynamic>{
    'signature': instance.signature,
    'marker': instance.marker,
    'host': instance.host,
    'user_ip': instance.userIp,
    'locale': instance.locale,
    'trip_class': instance.tripClass,
    'passengers': passengers,
    'segments': segments,
    'currency': instance.currency,
  };
}
