import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flight_booking/Core/Constants/searchTerms.dart';
import 'package:flight_booking/Models/FlightSearchPostModel/FlightSearchPostModel.dart';
import 'package:flight_booking/Models/FlightSearchPostModel/segment.dart';
import 'package:crypto/crypto.dart' as crypto;
import 'package:flight_booking/Services/Exception/NetworkExceptions.dart';

class FlightSearch {
  final FlightSearchPostModel postModel;
  final Dio dio;
  final String? apiKey;

  FlightSearch({
    required this.apiKey,
    required this.postModel,
  }) : dio = Dio();

  Future<String?> postRequest() async {
    try {
      final signature = await getSignatureFromFlightPostData();
      postModel.signature = signature;
    } on SignatureFormationException {
      throw SignatureFormationException();
    } catch (_) {
      throw GenericException();
    }

    final result = postModel.toJson();

    String? searchId;
    try {
      final response = await dio.post(baseUrl + postUrl, data: result);
      if (response.statusCode == 400) {
        throw Network404Exception();
      }

      searchId = response.data['search_id'];
      if (searchId == null) {
        throw SearchIdNotFoundException();
      }
    } on DioException {
      throw DioRequestException();
    } catch (_) {
      throw GenericException();
    }
    return searchId;
  }

  Future<List<Map<String, dynamic>>> getRequest(String? searchId) async {
    bool isFound = false;
    Response response;

    final List<dynamic> data = [];
    final List<Map<String, dynamic>> dataAsMap = [];
    while (!isFound) {
      try {
        response = await dio.get(
          baseUrl + getUrl,
          queryParameters: {'uuid': searchId},
        );
        // log(response.toString());
      } on DioException {
        throw DioRequestException();
      } catch (_) {
        throw GenericException();
      }

      if (response.data is List) {
        final dataList = response.data as List;
        //log(dataList.toString());

        final firstElement = dataList.first as Map<String, dynamic>;
        if (firstElement['proposals'] is List) {
          List<dynamic> proposals = firstElement['proposals'] as List;
          if (proposals.isNotEmpty) {
            data.addAll(dataList);
          } else {}
        }
        final lastElement = dataList.last as Map<String, dynamic>;

        if (lastElement.keys.first == 'search_id') {
          isFound = true;
        } else {
          //exception handling
        }
      } else {
        //exception handling
      }
    }

    for (var element in data) {
      if (element is Map<String, dynamic>) {
        dataAsMap.add(element);
      } else {}
    }

    return dataAsMap;
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
    try {
      return generateMd5(data);
    } catch (_) {
      throw SignatureFormationException();
    }
  }

  String generateMd5(String data) {
    try {
      var content = utf8.encode(data);
      var md5 = crypto.md5;
      var digest = md5.convert(content);
      return digest.toString();
    } catch (_) {
      throw SignatureFormationException();
    }
  }
}
