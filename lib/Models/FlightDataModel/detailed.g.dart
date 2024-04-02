// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detailed.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Detailed _$DetailedFromJson(Map<String, dynamic> json) => Detailed(
      transfer: (json['transfer'] as num?)?.toDouble(),
      departureTime: json['departure_time'] as int?,
      arrivalTime: (json['arrival_time'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$DetailedToJson(Detailed instance) => <String, dynamic>{
      'transfer': instance.transfer,
      'departure_time': instance.departureTime,
      'arrival_time': instance.arrivalTime,
    };
