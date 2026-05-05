import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sneakcom_ecom/features/authentication/core/model/user_model.dart';

final userProvider = StreamProvider<UserModel>((ref) {
  final uid = FirebaseAuth.instance.currentUser!.uid;

  return FirebaseFirestore.instance
      .collection('users')
      .doc(uid)
      .snapshots()
      .map((doc) {
        final data = doc.data();
        if (data == null) {
          throw Exception("User not found");
        }
        return UserModel.fromMap(data);
      });
});
