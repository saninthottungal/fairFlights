import 'package:json_annotation/json_annotation.dart';
part 'airline_details.g.dart';

@JsonSerializable()
class AirlineDetails {
  @JsonKey(name: 'id')
  String? id;
  @JsonKey(name: 'iata')
  String? iata;
  @JsonKey(name: 'average_rate')
  String? averageRate;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'alliance_name')
  String? allianceName;
  @JsonKey(name: 'brand_color')
  String? brandColor;

  AirlineDetails({
    this.id,
    this.allianceName,
    this.averageRate,
    this.brandColor,
    this.iata,
    this.name,
  });

  factory AirlineDetails.fromJson(Map<String, dynamic> json) =>
      _$AirlineDetailsFromJson(json);
}
