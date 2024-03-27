// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'passengers.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Passengers _$PassengersFromJson(Map<String, dynamic> json) => Passengers(
      adults: json['adults'] as int?,
      children: json['children'] as int?,
      infants: json['infants'] as int?,
    );

Map<String, dynamic> _$PassengersToJson(Passengers instance) =>
    <String, dynamic>{
      'adults': instance.adults,
      'children': instance.children,
      'infants': instance.infants,
    };
