// creating a stream of user - streamprovider
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sneakcom_ecom/features/authencation/core/model/user_model.dart';

import 'package:firebase_auth/firebase_auth.dart';

final authStateProvider = StreamProvider<UserModel?>((ref) {
  return FirebaseAuth.instance.authStateChanges().map((user) {
    if (user == null) return null;

    return UserModel(
      uid: user.uid,
      email: user.email!,
      name: '',
      phone: null,
      photoUrl: null,
      createdAt: DateTime.now(),
      cartCount: 0,
      wishlistCount: 0,
      isActive: true,
      role: 'user',
    );
  });
});
