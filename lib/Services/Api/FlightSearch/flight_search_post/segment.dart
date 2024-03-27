import 'package:json_annotation/json_annotation.dart';

part 'segment.g.dart';

@JsonSerializable()
class Segment {
  String? origin;
  String? destination;
  String? date;

  Segment({this.origin, this.destination, this.date});

  factory Segment.fromJson(Map<String, dynamic> json) {
    return _$SegmentFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SegmentToJson(this);
}
