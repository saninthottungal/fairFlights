// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'terms.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Terms _$TermsFromJson(Map<String, dynamic> json) {
  final String key = json.keys.first;
  return Terms(
    cost: json[key] == null
        ? null
        : Cost.fromJson(json[key] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$TermsToJson(Terms instance) => <String, dynamic>{
      'cost': instance.cost,
    };
