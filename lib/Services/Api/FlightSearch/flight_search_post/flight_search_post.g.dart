// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flight_search_post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FlightSearchPost _$FlightSearchPostFromJson(Map<String, dynamic> json) =>
    FlightSearchPost(
      signature: json['signature'] as String?,
      marker: json['marker'] as String?,
      host: json['host'] as String?,
      userIp: json['user_ip'] as String?,
      locale: json['locale'] as String?,
      tripClass: json['trip_class'] as String?,
      passengers: json['passengers'] == null
          ? null
          : Passengers.fromJson(json['passengers'] as Map<String, dynamic>),
      segments: (json['segments'] as List<dynamic>?)
          ?.map((e) => Segment.fromJson(e as Map<String, dynamic>))
          .toList(),
      currency: json['currency'] as String?,
    );

Map<String, dynamic> _$FlightSearchPostToJson(FlightSearchPost instance) =>
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
