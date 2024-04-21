import 'package:json_annotation/json_annotation.dart';

import 'detailed.dart';

part 'rating.g.dart';

@JsonSerializable()
class Rating {
  double? total;
  Detailed? detailed;

  Rating({this.total, this.detailed});

  factory Rating.fromJson(Map<String, dynamic> json) {
    return _$RatingFromJson(json);
  }

  Map<String, dynamic> toJson() => _$RatingToJson(this);
}
