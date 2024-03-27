import 'package:flight_booking/Services/Api/FlightSearch/flight_search_post/flightSignature.dart';
import 'package:json_annotation/json_annotation.dart';

import 'passengers.dart';
import 'segment.dart';

part 'flight_search_post.g.dart';

@JsonSerializable()
class FlightSearchPost {
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
  List<Segment>? segments;
  @JsonKey(name: 'currency')
  String? currency;

  FlightSearchPost({
    this.signature,
    this.marker,
    this.host,
    this.userIp,
    this.locale,
    this.tripClass,
    this.passengers,
    this.segments,
    this.currency,
  });

  factory FlightSearchPost.fromJson(Map<String, dynamic> json) {
    return _$FlightSearchPostFromJson(json);
  }

  Map<String, dynamic> toJson() => _$FlightSearchPostToJson(this);

  Future<String?> getSignature() async {
    return getSignatureFromFlightPostData(flightData: this);
  }
}
