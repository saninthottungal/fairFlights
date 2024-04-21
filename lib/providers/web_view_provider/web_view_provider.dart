import 'package:dio/dio.dart';
import 'package:flight_booking/core/constants/search_terms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class WebViewProvider extends ChangeNotifier {
  String? customAgencyRequestLink;
  String? agencyLink;
  Dio dio = Dio();

  set setCustomAgencyRequestLink(String? value) {
    customAgencyRequestLink = value;
    notifyListeners();
  }

  set setAgencyLink(String? value) {
    agencyLink = value;
    notifyListeners();
  }

  Future<String?> agencyLinkRequest(
      {required num? urlCode, required String? sId}) async {
    String? marker = dotenv.env['API_MARKER'];
    num? url = urlCode;
    String? searchId = sId;
    String rawAgencyLink = agencyRequestLink;
    if (searchId != null && url != null && marker != null) {
      rawAgencyLink = rawAgencyLink.replaceFirst('search_id', searchId);
      rawAgencyLink = rawAgencyLink.replaceFirst('terms.url', '$url');
      rawAgencyLink = rawAgencyLink.replaceFirst('marker', marker);
      setCustomAgencyRequestLink = rawAgencyLink;
    } else {
      setCustomAgencyRequestLink = null;
    }

    if (customAgencyRequestLink != null) {
      final response = await dio.getUri(Uri.parse(customAgencyRequestLink!));

      if (response.data is Map<String, dynamic>) {
        final data = response.data as Map<String, dynamic>;
        if (data.containsKey('url')) {
          setAgencyLink = data['url'];
        }
      }
    }
    return agencyLink;
  }
}
