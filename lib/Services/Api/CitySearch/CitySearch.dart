import 'package:dio/dio.dart';
import 'package:flight_booking/Models/CityModel/CityModel.dart';
import 'package:flight_booking/Services/Api/CitySearch/constants.dart';

Future<List<CityModel>> searchCities(String value) async {
  final dio = Dio();

  Response response = await dio.get(baseUri + value);

  if (response.statusCode == 200) {
    final data = response.data;

    if (data is List) {
      final jsonCities = data.cast<Map<String, dynamic>>();
      final cities = jsonCities.map((cityAsJson) {
        return CityModel.fromJson(cityAsJson);
      }).toList();

      return cities;
    } else {
      return [];
    }
  } else {
    return [];
  }
}
