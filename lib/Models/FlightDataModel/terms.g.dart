// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'terms.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Terms _$TermsFromJson(Map<String, dynamic> json) => Terms(
      cost: json['cost'] == null
          ? null
          : Cost.fromJson(json['cost'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TermsToJson(Terms instance) => <String, dynamic>{
      'cost': instance.cost,
    };
