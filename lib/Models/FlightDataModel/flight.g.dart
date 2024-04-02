// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flight.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Flight _$FlightFromJson(Map<String, dynamic> json) => Flight(
      aircraft: json['aircraft'] as String?,
      arrival: json['arrival'] as String?,
      arrivalDate: json['arrival_date'] as String?,
      arrivalTime: json['arrival_time'] as String?,
      arrivalTimestamp: json['arrival_timestamp'] as int?,
      delay: json['delay'] as int?,
      departure: json['departure'] as String?,
      departureDate: json['departure_date'] as String?,
      departureTime: json['departure_time'] as String?,
      departureTimestamp: json['departure_timestamp'] as int?,
      duration: json['duration'] as int?,
      equipment: json['equipment'] as String?,
      localArrivalTimestamp: json['local_arrival_timestamp'] as int?,
      localDepartureTimestamp: json['local_departure_timestamp'] as int?,
      marketingCarrier: json['marketing_carrier'] as String?,
      number: json['number'] as String?,
      operatingCarrier: json['operating_carrier'] as String?,
      operatedBy: json['operated_by'] as String?,
      rating: json['rating'] as int?,
      technicalStops: json['technical_stops'],
      tripClass: json['trip_class'] as String?,
    );

Map<String, dynamic> _$FlightToJson(Flight instance) => <String, dynamic>{
      'aircraft': instance.aircraft,
      'arrival': instance.arrival,
      'arrival_date': instance.arrivalDate,
      'arrival_time': instance.arrivalTime,
      'arrival_timestamp': instance.arrivalTimestamp,
      'delay': instance.delay,
      'departure': instance.departure,
      'departure_date': instance.departureDate,
      'departure_time': instance.departureTime,
      'departure_timestamp': instance.departureTimestamp,
      'duration': instance.duration,
      'equipment': instance.equipment,
      'local_arrival_timestamp': instance.localArrivalTimestamp,
      'local_departure_timestamp': instance.localDepartureTimestamp,
      'marketing_carrier': instance.marketingCarrier,
      'number': instance.number,
      'operating_carrier': instance.operatingCarrier,
      'operated_by': instance.operatedBy,
      'rating': instance.rating,
      'technical_stops': instance.technicalStops,
      'trip_class': instance.tripClass,
    };
