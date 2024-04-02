import 'package:json_annotation/json_annotation.dart';

import 'duration.dart';

part 'transfer.g.dart';

@JsonSerializable()
class Transfer {
  String? at;
  String? to;
  List<String>? airports;
  List<String>? airlines;
  @JsonKey(name: 'country_code')
  String? countryCode;
  @JsonKey(name: 'city_code')
  String? cityCode;
  @JsonKey(name: 'recheck_baggage')
  bool? recheckBaggage;
  @JsonKey(name: 'night_transfer')
  bool? nightTransfer;
  List<String>? tags;
  @JsonKey(name: 'duration_seconds')
  num? durationSeconds;
  Duration? duration;

  Transfer({
    this.at,
    this.to,
    this.airports,
    this.airlines,
    this.countryCode,
    this.cityCode,
    this.recheckBaggage,
    this.nightTransfer,
    this.tags,
    this.durationSeconds,
    this.duration,
  });

  factory Transfer.fromJson(Map<String, dynamic> json) {
    return _$TransferFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TransferToJson(this);
}
