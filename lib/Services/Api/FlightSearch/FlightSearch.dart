import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flight_booking/Core/Constants/searchTerms.dart';
import 'package:flight_booking/Models/FlightSearchPostModel/FlightSearchPostModel.dart';
import 'package:flight_booking/Models/FlightSearchPostModel/segment.dart';
import 'package:crypto/crypto.dart' as crypto;

class FlightSearch {
  final FlightSearchPostModel postModel;
  final Dio dio;
  final String? apiKey;

  FlightSearch({
    required this.apiKey,
    required this.postModel,
  }) : dio = Dio();

  Future<String?> postRequest() async {
    final signature = await getSignatureFromFlightPostData();

    postModel.signature = signature;
    final result = postModel.toJson();
    print(result);
    String? searchId;
    try {
      final response = await dio.post(baseUrl + postUrl, data: result);
      print(response.data);
      searchId = response.data['search_id'];
    } catch (e) {
      print(e.toString());

      //error handling
    }
    return searchId;
  }

  Future<List> getRequest(String? searchId) async {
    bool isFound = false;
    Response response;

    final List data = [];

    while (!isFound) {
      response = await dio.get(
        baseUrl + getUrl,
        queryParameters: {'uuid': searchId},
      );

      if (response.data is List) {
        final dataList = response.data as List;
        data.addAll(dataList);

        final lastElement = dataList.last as Map<String, dynamic>;
        if (lastElement.length == 1) {
          if (lastElement.containsKey('search_id')) {
            isFound = true;
          }
        }
      }
    }
    return data;
  }

  Future<String?> getSignatureFromFlightPostData() async {
    int? adults = postModel.passengers?.adults;
    int? children = postModel.passengers?.children;
    int? infants = postModel.passengers?.infants;
    String? tripClass = postModel.tripClass;
    String? marker = postModel.marker;
    String? userIp = postModel.userIp;
    Segment? segment1;
    String? date1;
    String? destination1;
    String? origin1;
    Segment? segment2;
    String? date2;
    String? destination2;
    String? origin2;
    String data;

    if (postModel.segments?.length == 2) {
      segment1 = postModel.segments?[0];
      date1 = segment1?.date;
      destination1 = segment1?.destination;
      origin1 = segment1?.origin;
      segment2 = postModel.segments?[1];
      date2 = segment2?.date;
      destination2 = segment2?.destination;
      origin2 = segment2?.origin;

      data =
          '$apiKey:$flightCurrency:$flightHost:$flightLocale:$marker:$adults:$children:$infants:$date1:$destination1:$origin1:$date2:$destination2:$origin2:$tripClass:$userIp';
    } else {
      segment1 = postModel.segments?[0];
      date1 = segment1?.date;
      destination1 = segment1?.destination;
      origin1 = segment1?.origin;
      data =
          '$apiKey:$flightCurrency:$flightHost:$flightLocale:$marker:$adults:$children:$infants:$date1:$destination1:$origin1:$tripClass:$userIp';
    }

    return generateMd5(data);
  }

  String generateMd5(String data) {
    var content = utf8.encode(data);
    var md5 = crypto.md5;
    var digest = md5.convert(content);
    return digest.toString();
  }
}
