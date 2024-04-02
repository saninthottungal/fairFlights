// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Cost.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Cost _$CostFromJson(Map<String, dynamic> json) => Cost(
      currency: json['currency'] as String?,
      price: json['price'] as num?,
      unifiedPrice: json['unified_price'] as num?,
      url: json['url'] as num?,
      flightsBaggage: (json['flights_baggage'] as List<dynamic>?)
          ?.map((e) => (e as List<dynamic>).map((e) => e as bool).toList())
          .toList(),
      flightsHandbags: (json['flights_handbags'] as List<dynamic>?)
          ?.map((e) => (e as List<dynamic>).map((e) => e as String).toList())
          .toList(),
      baggageSource: (json['baggage_source'] as List<dynamic>?)
          ?.map((e) => (e as List<dynamic>).map((e) => e as num).toList())
          .toList(),
      handbagsSource: (json['handbags_source'] as List<dynamic>?)
          ?.map((e) => (e as List<dynamic>).map((e) => e as num).toList())
          .toList(),
    );

Map<String, dynamic> _$CostToJson(Cost instance) => <String, dynamic>{
      'currency': instance.currency,
      'price': instance.price,
      'unified_price': instance.unifiedPrice,
      'url': instance.url,
      'flights_baggage': instance.flightsBaggage,
      'flights_handbags': instance.flightsHandbags,
      'baggage_source': instance.baggageSource,
      'handbags_source': instance.handbagsSource,
    };
