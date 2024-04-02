import 'package:json_annotation/json_annotation.dart';

part 'Cost.g.dart';

@JsonSerializable()
class Cost {
  String? currency;
  num? price;
  @JsonKey(name: 'unified_price')
  num? unifiedPrice;
  num? url;
  @JsonKey(name: 'flights_baggage')
  List<List<bool>>? flightsBaggage;
  @JsonKey(name: 'flights_handbags')
  List<List<String>>? flightsHandbags;
  @JsonKey(name: 'baggage_source')
  List<List<num>>? baggageSource;
  @JsonKey(name: 'handbags_source')
  List<List<num>>? handbagsSource;

  Cost({
    this.currency,
    this.price,
    this.unifiedPrice,
    this.url,
    this.flightsBaggage,
    this.flightsHandbags,
    this.baggageSource,
    this.handbagsSource,
  });

  factory Cost.fromJson(Map<String, dynamic> json) => _$CostFromJson(json);

  Map<String, dynamic> toJson() => _$CostToJson(this);
}
