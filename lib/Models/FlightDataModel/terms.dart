import 'package:json_annotation/json_annotation.dart';

import 'Cost.dart';

part 'terms.g.dart';

@JsonSerializable()
class Terms {
  Terms({this.cost});

  Cost? cost;

  factory Terms.fromJson(Map<String, dynamic> json) => _$TermsFromJson(json);

  Map<String, dynamic> toJson() => _$TermsToJson(this);
}
