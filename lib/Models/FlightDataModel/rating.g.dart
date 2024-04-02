// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rating.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Rating _$RatingFromJson(Map<String, dynamic> json) => Rating(
      total: (json['total'] as num?)?.toDouble(),
      detailed: json['detailed'] == null
          ? null
          : Detailed.fromJson(json['detailed'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RatingToJson(Rating instance) => <String, dynamic>{
      'total': instance.total,
      'detailed': instance.detailed,
    };
