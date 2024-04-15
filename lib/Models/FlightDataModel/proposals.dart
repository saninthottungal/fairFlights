import 'package:json_annotation/json_annotation.dart';

import 'segment.dart';
import 'terms.dart';
part 'proposal.g.dart';

@JsonSerializable()
class Proposals {
  @JsonKey(name: 'terms')
  Terms? terms;
  @JsonKey(name: 'segment')
  List<Segment>? segment;
  @JsonKey(name: 'total_duration')
  num? totalDuration;
  @JsonKey(name: 'stops_airports')
  List<String>? stopsAirports;
  @JsonKey(name: 'max_stops')
  num? maxStops;
  @JsonKey(name: 'carriers')
  List<String>? carriers;
  @JsonKey(name: 'segment_durations')
  List<num>? segmentDurations;
  @JsonKey(name: 'segments_airports')
  List<List<String>>? segmentsAirports;
  @JsonKey(name: 'is_direct')
  bool? isDirect;
  @JsonKey(name: 'segments_rating')
  double? segmentsRating;

  Proposals({
    this.terms,
    this.segment,
    this.totalDuration,
    this.stopsAirports,
    this.maxStops,
    this.carriers,
    this.segmentDurations,
    this.segmentsAirports,
    this.isDirect,
    this.segmentsRating,
  });

  factory Proposals.fromJson(Map<String, dynamic> json) {
    return _$FlightDataModelFromJson(json);
  }

  Proposals.fromFlight(Proposals proposal) {}
}
