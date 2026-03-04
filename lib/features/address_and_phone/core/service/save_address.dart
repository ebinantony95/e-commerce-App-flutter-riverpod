import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sneakcom_ecom/features/address_and_phone/core/models/address_model.dart';

Future<void> saveAddress(AddressModel address) async {
  final userId = FirebaseAuth.instance.currentUser!.uid;

  await FirebaseFirestore.instance.collection("users").doc(userId).set({
    "address": address.toMap(),
  }, SetOptions(merge: true));
}
