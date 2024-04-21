// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'airline_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AirlineDetails _$AirlineDetailsFromJson(Map<String, dynamic> json) {
  return AirlineDetails(
    id: '${json['id']}',
    allianceName: json['alliance_name'] as String?,
    averageRate: "${json['average_rate']}",
    brandColor: json['brand_color'] as String?,
    iata: json['iata'] as String?,
    name: json['name'] as String?,
  );
}
