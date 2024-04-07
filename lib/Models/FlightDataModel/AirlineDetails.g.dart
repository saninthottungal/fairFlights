// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AirlineDetails.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AirlineDetails _$AirlineDetailsFromJson(Map<String, dynamic> json) =>
    AirlineDetails(
      id: json['id'] as String?,
      allianceName: json['alliance_name'] as String?,
      averageRate: json['average_rate'] as String?,
      brandColor: json['brand_color'] as String?,
      iata: json['iata'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$AirlineDetailsToJson(AirlineDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'iata': instance.iata,
      'average_rate': instance.averageRate,
      'name': instance.name,
      'alliance_name': instance.allianceName,
      'brand_color': instance.brandColor,
    };
