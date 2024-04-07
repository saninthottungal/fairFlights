// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Airline.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Airline _$AirlineFromJson(Map<String, dynamic> json) => Airline(
      details: json['details'] == null
          ? null
          : AirlineDetails.fromJson(json['details'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AirlineToJson(Airline instance) => <String, dynamic>{
      'details': instance.details,
    };
