import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flight_booking/services/firestore/firestore_functions.dart';
import 'package:flutter/material.dart';

class FirestoreProvider extends ChangeNotifier {
  final FirestoreFunctions firestoreFunctions =
      FirestoreFunctions(firstore: FirebaseFirestore.instance);

  Future<void> addDataToFirestore({
    required String collectionPath,
    required Map<String, dynamic> data,
  }) async {
    firestoreFunctions.addDataToFirestore(
      collectionPath: collectionPath,
      data: data,
    );
  }
}
