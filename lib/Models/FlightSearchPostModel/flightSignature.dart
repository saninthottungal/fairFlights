import 'dart:convert';

import 'package:flight_booking/Models/FlightSearchPostModel/FlightSearchPostModel.dart';
import 'package:flight_booking/Models/FlightSearchPostModel/segment.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:crypto/crypto.dart' as crypto;

Future<String?> getSignatureFromFlightPostData(
    {required FlightSearchPostModel? flightData}) async {
  String? apiKey = dotenv.env['API_KEY'];
  String? currency = flightData?.currency;
  String? host = flightData?.host;
  String? locale = flightData?.locale;
  String? marker = flightData?.marker;
  int? adults = flightData?.passengers?.adults;
  int? children = flightData?.passengers?.children;
  int? infants = flightData?.passengers?.infants;
  Segment? segment1 = flightData?.segments?[0];
  String? date1 = segment1?.date;
  String? destination1 = segment1?.destination;
  String? origin1 = segment1?.origin;
  Segment? segment2 = flightData?.segments?[1];
  String? date2 = segment2?.date;
  String? destination2 = segment2?.destination;
  String? origin2 = segment2?.origin;
  String? tripClass = flightData?.tripClass;
  String? userIp = flightData?.userIp;

  String data =
      '$apiKey:$currency:$host:$locale:$marker:$adults:$children:$infants:$date1:$destination1:$origin1:$date2:$destination2:$origin2:$tripClass:$userIp';
  print(data);

  return generateMd5(data);
}

String generateMd5(String data) {
  var content = utf8.encode(data);
  var md5 = crypto.md5;
  var digest = md5.convert(content);
  return digest.toString();
}
