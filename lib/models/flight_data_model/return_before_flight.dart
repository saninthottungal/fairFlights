import 'package:json_annotation/json_annotation.dart';

part 'return_before_flight.g.dart';

@JsonSerializable()
class ReturnBeforeFlight {
  bool? available;

  ReturnBeforeFlight({this.available});

  factory ReturnBeforeFlight.fromJson(Map<String, dynamic> json) {
    return _$ReturnBeforeFlightFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ReturnBeforeFlightToJson(this);
}
