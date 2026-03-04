import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sneakcom_ecom/features/address_and_phone/core/models/address_model.dart';

final addressProvider = StreamProvider<AddressModel?>((ref) {
  final userId = FirebaseAuth.instance.currentUser!.uid;

  return FirebaseFirestore.instance
      .collection("users")
      .doc(userId)
      .snapshots()
      .map((doc) {
        if (!doc.exists || doc.data()?["address"] == null) {
          return null;
        }

        return AddressModel.fromMap(doc.data()!["address"]);
      });
});
