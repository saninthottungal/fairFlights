// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cost.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Cost _$CostFromJson(Map<String, dynamic> json) => Cost(
      currency: json['currency'] as String?,
      price: json['price'] as num?,
      unifiedPrice: json['unified_price'] as num?,
      url: json['url'] as num?,
    );

Map<String, dynamic> _$CostToJson(Cost instance) => <String, dynamic>{
      'currency': instance.currency,
      'price': instance.price,
      'unified_price': instance.unifiedPrice,
      'url': instance.url,
    };
