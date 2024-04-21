// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CityModel _$CityModelFromJson(Map<String, dynamic> json) => CityModel(
      id: json['id'] as String?,
      type: json['type'] as String?,
      code: json['code'] as String?,
      name: json['name'] as String?,
      countryCode: json['country_code'] as String?,
      countryName: json['country_name'] as String?,
      mainAirportName: json['main_airport_name'] as String?,
      cityName: json['city_name'] as String?,
    );

Map<String, dynamic> _$CityModelToJson(CityModel instance) => <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'code': instance.code,
      'name': instance.name,
      'country_code': instance.countryCode,
      'country_name': instance.countryName,
      'main_airport_name': instance.mainAirportName,
      'city_name': instance.cityName,
    };
