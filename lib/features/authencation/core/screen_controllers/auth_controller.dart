import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:sneakcom_ecom/features/authencation/core/model/user_model.dart';
import 'package:sneakcom_ecom/features/authencation/core/screen_controllers/auth_provider.dart';

final authColtrollerProvider = StateNotifierProvider<AuthController, bool>((
  ref,
) {
  return AuthController(ref);
});

class AuthController extends StateNotifier<bool> {
  final Ref ref;
  AuthController(this.ref) : super(false);

  //to get databas(cloud firestore) instance
  final _db = FirebaseFirestore.instance;

  // create acc.........
  Future<void> createAcc({
    required String email,
    required String password,
    required String name,
  }) async {
    state = true; // loading...
    try {
      final cred = await ref
          .read(firebaseAuthProvider)
          .createUserWithEmailAndPassword(email: email, password: password);

      User? user = cred.user;
      // handle the exception if user value retur is null

      if (user == null) {
        throw FirebaseAuthException(
          code: 'user-null',
          message: 'User creation failed',
        );
      }
      // creating the collection......
      // we declear Usermodel for createing a user here
      final userModel = UserModel(
        uid: user.uid,
        email: email,
        name: name,
        phone: null,
        photoUrl: null,
        createdAt: DateTime.now(),
        cartCount: 0,
        wishlistCount: 0,
        isActive: true,
        role: 'user',
      );

      await _db.collection('user').doc(user.uid).set(userModel.toMap());
    } catch (e) {
      debugPrint('Unknown error: $e');
      rethrow;
    } finally {
      state = false;
    }
  }

  /// LOGIN
  Future<void> login({required String email, required String password}) async {
    state = true;

    try {
      await ref
          .read(firebaseAuthProvider)
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      debugPrint(e.toString());
      rethrow; // 🔥 IMPORTANT: send error back to UI
    } finally {
      state = false;
    }
  }

  /// LOGOUT
  Future<void> logout() async {
    await ref.read(firebaseAuthProvider).signOut();
  }
}
