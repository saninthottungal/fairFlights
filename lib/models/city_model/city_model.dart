import 'package:json_annotation/json_annotation.dart';

part 'city_model.g.dart';

@JsonSerializable()
class CityModel {
  @JsonKey(name: 'id')
  String? id;
  @JsonKey(name: 'type')
  String? type;
  @JsonKey(name: 'code')
  String? code;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'country_code')
  String? countryCode;
  @JsonKey(name: 'country_name')
  String? countryName;
  @JsonKey(name: 'main_airport_name')
  String? mainAirportName;
  @JsonKey(name: 'city_name')
  String? cityName;

  CityModel({
    this.id,
    this.type,
    this.code,
    this.name,
    this.countryCode,
    this.countryName,
    this.mainAirportName,
    this.cityName,
  });

  factory CityModel.fromJson(Map<String, dynamic> json) {
    final value = _$CityModelFromJson(json);

    return value;
  }

  Map<String, dynamic> toJson() => _$CityModelToJson(this);
}
