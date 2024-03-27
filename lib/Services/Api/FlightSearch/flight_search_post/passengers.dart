import 'package:json_annotation/json_annotation.dart';

part 'passengers.g.dart';

@JsonSerializable()
class Passengers {
  int? adults;
  int? children;
  int? infants;

  Passengers({this.adults, this.children, this.infants});

  factory Passengers.fromJson(Map<String, dynamic> json) {
    return _$PassengersFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PassengersToJson(this);
}
