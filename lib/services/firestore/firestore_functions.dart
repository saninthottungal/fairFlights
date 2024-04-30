import 'package:cloud_firestore/cloud_firestore.dart';

import '../connectivty/check_connectivty.dart';
import '../exception/network_exceptions.dart';

class FirestoreFunctions {
  final FirebaseFirestore _firstore;
  FirestoreFunctions({required FirebaseFirestore firstore})
      : _firstore = firstore;
  //adding data

  Future<void> addDataToFirestore({
    required String collectionPath,
    required Map<String, dynamic> data,
  }) async {
    final isConnectionAvailable =
        await CheckNetConnectivity().checknetConnectivity();
    if (!isConnectionAvailable) {
      throw Network404Exception();
    }
    final collection = _firstore.collection(collectionPath);
    try {
      await collection.add(data);
    } catch (_) {
      throw GenericException();
    }
  }

  //get countries

  Future<List<Map<String, dynamic>>> getCountries() async {
    final isConnectionAvailable =
        await CheckNetConnectivity().checknetConnectivity();
    if (!isConnectionAvailable) {
      throw Network404Exception();
    }
    try {
      QuerySnapshot<Map<String, dynamic>> snapshot =
          await _firstore.collection('countries').get();
      List<Map<String, dynamic>> countries = snapshot.docs.map((docsnap) {
        return docsnap.data();
      }).toList();

      return countries;
    } catch (_) {
      throw GenericException();
    }
  }

  Future<Map<String, dynamic>> getWhatsappInfo() async {
    final isConnectionAvailable =
        await CheckNetConnectivity().checknetConnectivity();
    if (!isConnectionAvailable) {
      throw Network404Exception();
    }

    try {
      final snapshot = await _firstore.collection('contacts').get();
      final whatapp = snapshot.docs.first.data();
      return whatapp;
    } catch (_) {
      throw GenericException();
    }
  }
}
