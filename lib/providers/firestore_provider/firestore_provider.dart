import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flight_booking/services/firestore/firestore_functions.dart';
import 'package:flutter/material.dart';

import '../../services/exception/network_exceptions.dart';

class FirestoreProvider extends ChangeNotifier {
  final FirestoreFunctions _firestoreFunctions =
      FirestoreFunctions(firstore: FirebaseFirestore.instance);
  List<Map<String, dynamic>> countries = [];
  String? selectedCountry;

  set setCountry(String? country) {
    selectedCountry = country;
    notifyListeners();
  }

  Future<String?> addDataToFirestore({
    required String collectionPath,
    required Map<String, dynamic> data,
  }) async {
    try {
      await _firestoreFunctions.addDataToFirestore(
          collectionPath: collectionPath, data: data);
    } on Network404Exception {
      return 'No network connection found.';
    } on GenericException {
      return 'Unknown error occured';
    }
    return null;
  }

  Future<void> getCountryData() async {
    final countryData = await _firestoreFunctions.getCountries();
    countries.clear();
    countries.addAll(countryData);
    notifyListeners();
  }
}
