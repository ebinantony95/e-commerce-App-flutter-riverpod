import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:sneakcom_ecom/features/authencation/core/model/user_model.dart';

//to get the firebase instance - proviedr
final firebaseAuthProvider = Provider<FirebaseAuth>((ref) {
  return FirebaseAuth.instance;
});

// // creating a stream of user - streamprovider
// final authStateProvider = StreamProvider<UserModel?>((ref) {
//   return ref.read(authStateProvider).authStateChanges();
// });
