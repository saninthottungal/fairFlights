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
}
