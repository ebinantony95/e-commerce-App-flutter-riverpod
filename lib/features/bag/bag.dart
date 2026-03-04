import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sneakcom_ecom/features/authencation/core/screen_controllers/auth_stateprovier.dart';
import 'package:sneakcom_ecom/features/bag/ui/widgets/cart_screen.dart';

class Bag extends ConsumerWidget {
  const Bag({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateProvider);
    final user = authState.value;

    if (user == null) {
      return const Scaffold(body: Center(child: Text("User not logged in")));
    }

    final userId = user.uid;

    return Scaffold(body: CartScreen(userId: userId));
  }
}
