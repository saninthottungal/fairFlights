import 'package:json_annotation/json_annotation.dart';

import 'segment.dart';
import 'terms.dart';
part 'flight_data_model.g.dart';

@JsonSerializable()
class FlightDataModel {
  @JsonKey(name: 'terms')
  Terms? terms;
  List<Segment>? segment;
  @JsonKey(name: 'total_duration')
  int? totalDuration;
  @JsonKey(name: 'stops_airports')
  List<String>? stopsAirports;
  @JsonKey(name: 'is_charter')
  bool? isCharter;
  @JsonKey(name: 'max_stops')
  int? maxStops;
  @JsonKey(name: 'max_stop_duration')
  int? maxStopDuration;
  @JsonKey(name: 'min_stop_duration')
  int? minStopDuration;
  List<String>? carriers;
  @JsonKey(name: 'segment_durations')
  List<int>? segmentDurations;
  @JsonKey(name: 'segments_time')
  List<List<int>>? segmentsTime;
  @JsonKey(name: 'segments_airports')
  List<List<String>>? segmentsAirports;
  String? sign;
  @JsonKey(name: 'is_direct')
  bool? isDirect;
  @JsonKey(name: 'flight_weight')
  double? flightWeight;
  int? popularity;
  @JsonKey(name: 'segments_rating')
  double? segmentsRating;
  List<String>? tags;
  @JsonKey(name: 'validating_carrier')
  String? validatingCarrier;

  FlightDataModel({
    this.terms,
    this.segment,
    this.totalDuration,
    this.stopsAirports,
    this.isCharter,
    this.maxStops,
    this.maxStopDuration,
    this.minStopDuration,
    this.carriers,
    this.segmentDurations,
    this.segmentsTime,
    this.segmentsAirports,
    this.sign,
    this.isDirect,
    this.flightWeight,
    this.popularity,
    this.segmentsRating,
    this.tags,
    this.validatingCarrier,
  });

  factory FlightDataModel.fromJson(Map<String, dynamic> json) {
    return _$FlightDataModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$FlightDataModelToJson(this);
}
