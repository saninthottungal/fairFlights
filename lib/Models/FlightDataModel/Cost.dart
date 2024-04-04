import 'package:json_annotation/json_annotation.dart';

part 'Cost.g.dart';

@JsonSerializable()
class Cost {
  String? currency;
  num? price;
  @JsonKey(name: 'unified_price')
  num? unifiedPrice;
  num? url;

  Cost({
    this.currency,
    this.price,
    this.unifiedPrice,
    this.url,
  });

  factory Cost.fromJson(Map<String, dynamic> json) => _$CostFromJson(json);

  Map<String, dynamic> toJson() => _$CostToJson(this);
}
