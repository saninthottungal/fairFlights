import 'package:json_annotation/json_annotation.dart';

import 'flight.dart';
import 'rating.dart';
import 'transfer.dart';

part 'segment.g.dart';

@JsonSerializable()
class Segment {
  List<Flight>? flight;
  Rating? rating;
  List<Transfer>? transfers;

  Segment({this.flight, this.rating, this.transfers});

  factory Segment.fromJson(Map<String, dynamic> json) {
    return _$SegmentFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SegmentToJson(this);
}
