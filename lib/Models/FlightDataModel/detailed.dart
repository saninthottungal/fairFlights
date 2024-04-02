import 'package:json_annotation/json_annotation.dart';

part 'detailed.g.dart';

@JsonSerializable()
class Detailed {
  double? transfer;
  @JsonKey(name: 'departure_time')
  int? departureTime;
  @JsonKey(name: 'arrival_time')
  double? arrivalTime;

  Detailed({this.transfer, this.departureTime, this.arrivalTime});

  factory Detailed.fromJson(Map<String, dynamic> json) {
    return _$DetailedFromJson(json);
  }

  Map<String, dynamic> toJson() => _$DetailedToJson(this);
}
