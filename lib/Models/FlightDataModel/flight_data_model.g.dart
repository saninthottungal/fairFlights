// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flight_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FlightDataModel _$FlightDataModelFromJson(Map<String, dynamic> json) {
  final tempProposals = (json['proposals'] as List<dynamic>?);
  final proposals = tempProposals?.map((e) {
    return Proposals.fromJson(e as Map<String, dynamic>);
  }).toList();
  final airlinesAsJson = json['airlines'] as Map<String, dynamic>;
  final Map<String, dynamic> airlines = {};
  airlinesAsJson.forEach(
    (key, value) {
      final airlineDetails = AirlineDetails.fromJson(value);
      final airline = {key: airlineDetails};
      airlines.addAll(airline);
    },
  );

  print(airlines);

  return FlightDataModel(
    airlines: json['airlines'] == null ? null : airlines,
    proposals: proposals,
    segments: (json['segments'] as List<dynamic>?)
        ?.map((e) => AirlineSegments.fromJson(e as Map<String, dynamic>))
        .toList(),
    numberOfProposal: tempProposals?.length,
  );
}
