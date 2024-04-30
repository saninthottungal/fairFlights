import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flight_booking/services/firestore/firestore_functions.dart';
import 'package:flutter/material.dart';

import '../../services/exception/network_exceptions.dart';

class FirestoreProvider extends ChangeNotifier {
  final FirestoreFunctions _firestoreFunctions =
      FirestoreFunctions(firstore: FirebaseFirestore.instance);
  List<Map<String, dynamic>> countries = [];
  List<Map<String, dynamic>> searchCountries = [];
  Map<String, dynamic>? whatsappInfo;
  String? selectedCountry;
  Map<String, dynamic>? privacyPolicyLink;

  set setCountry(String? country) {
    selectedCountry = country;
    notifyListeners();
  }

  void setSearchCountries() {
    searchCountries.clear();
    searchCountries.addAll(countries);
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

  Future<String?> getCountryData() async {
    try {
      final countryData = await _firestoreFunctions.getCountries();
      countries.clear();
      countries.addAll(countryData);
      searchCountries.clear();
      searchCountries.addAll(countryData);
      notifyListeners();
    } on Network404Exception {
      return 'No network connection found';
    } on GenericException {
      return 'Unknown error occured';
    }
    return null;
  }

  searchCountry(String value) {
    searchCountries.clear();

    for (var element in countries) {
      String country = element.entries.first.value as String;

      if (country.toLowerCase().contains(value.toLowerCase())) {
        searchCountries.add(element);
      }
    }
    notifyListeners();
  }

  Future<String?> getWhatsappInfo() async {
    try {
      whatsappInfo = await _firestoreFunctions.getWhatsappInfo();
      notifyListeners();
    } on Network404Exception {
      return 'No network connection found';
    } on GenericException {
      return 'Unknown error occured';
    }
    return null;
  }

  Future<String?> getPrivacyPolicyLink() async {
    try {
      privacyPolicyLink = await _firestoreFunctions.getPrivacyPolicyLink();
      notifyListeners();
    } on Network404Exception {
      return 'No network connection found';
    } on GenericException {
      return 'Unknown error occured';
    }
    return null;
  }
}
