import 'package:json_annotation/json_annotation.dart';
import 'passengers.dart';
import 'segment.dart';
import 'package:flight_booking/core/constants/search_terms.dart';
part 'flight_search_post_model.g.dart';

@JsonSerializable()
class FlightSearchPostModel {
  @JsonKey(name: 'signature')
  String? signature;
  @JsonKey(name: 'marker')
  String? marker;
  @JsonKey(name: 'host')
  String? host;
  @JsonKey(name: 'user_ip')
  String? userIp;
  @JsonKey(name: 'locale')
  String? locale;
  @JsonKey(name: 'trip_class')
  String? tripClass;
  @JsonKey(name: 'passengers')
  Passengers? passengers;
  @JsonKey(name: 'segments')
  List<Segment?>? segments;
  @JsonKey(name: 'currency')
  String? currency;

  FlightSearchPostModel({
    this.signature,
    this.marker,
    this.userIp,
    this.tripClass,
    this.passengers,
    this.segments,
  }) {
    currency = flightCurrency;
    host = flightHost;
    locale = flightLocale;
  }

  factory FlightSearchPostModel.fromJson(Map<String, dynamic> json) {
    return _$FlightSearchPostModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$FlightSearchPostModelToJson(this);
}
