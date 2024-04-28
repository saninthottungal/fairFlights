import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreFunctions {
  final FirebaseFirestore _firstore;
  FirestoreFunctions({required FirebaseFirestore firstore})
      : _firstore = firstore;
  //adding data

  Future<void> addDataToFirestore({
    required String collectionPath,
    required Map<String, dynamic> data,
  }) async {
    final collection = _firstore.collection(collectionPath);
    await collection.add(data);
  }
}
