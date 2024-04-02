// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transfer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Transfer _$TransferFromJson(Map<String, dynamic> json) => Transfer(
      at: json['at'] as String?,
      to: json['to'] as String?,
      airports: (json['airports'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      airlines: (json['airlines'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      countryCode: json['country_code'] as String?,
      cityCode: json['city_code'] as String?,
      recheckBaggage: json['recheck_baggage'] as bool?,
      nightTransfer: json['night_transfer'] as bool?,
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      durationSeconds: json['duration_seconds'] as int?,
      duration: json['duration'] == null
          ? null
          : Duration.fromJson(json['duration'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TransferToJson(Transfer instance) => <String, dynamic>{
      'at': instance.at,
      'to': instance.to,
      'airports': instance.airports,
      'airlines': instance.airlines,
      'country_code': instance.countryCode,
      'city_code': instance.cityCode,
      'recheck_baggage': instance.recheckBaggage,
      'night_transfer': instance.nightTransfer,
      'tags': instance.tags,
      'duration_seconds': instance.durationSeconds,
      'duration': instance.duration,
    };
