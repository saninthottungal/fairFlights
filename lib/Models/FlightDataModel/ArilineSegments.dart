import 'package:json_annotation/json_annotation.dart';
part 'ArilineSegments.g.dart';

@JsonSerializable()
class AirlineSegments {
  @JsonKey(name: 'origin')
  String? origin;
  @JsonKey(name: 'original_origin')
  String? originalOrigin;
  @JsonKey(name: 'destination')
  String? destination;
  @JsonKey(name: 'original_destination')
  String? originalDestination;
  @JsonKey(name: 'date')
  String? date;

  AirlineSegments({
    this.date,
    this.destination,
    this.origin,
    this.originalDestination,
    this.originalOrigin,
  });

  factory AirlineSegments.fromJson(Map<String, dynamic> json) =>
      _$AirlineSegmentsFromJson(json);
}
