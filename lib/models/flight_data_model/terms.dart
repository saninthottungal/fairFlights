import 'package:json_annotation/json_annotation.dart';

import 'cost.dart';

part 'terms.g.dart';

@JsonSerializable()
class Terms {
  Cost? cost;
  Terms({this.cost});

  factory Terms.fromJson(Map<String, dynamic> json) => _$TermsFromJson(json);

  Map<String, dynamic> toJson() => _$TermsToJson(this);
}
