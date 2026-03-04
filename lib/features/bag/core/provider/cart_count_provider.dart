import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sneakcom_ecom/features/authencation/core/screen_controllers/auth_stateprovier.dart';
import 'package:sneakcom_ecom/features/bag/core/provider/cart_stream_provider.dart';

final cartCountProvider = Provider<int>((ref) {
  final auth = ref.watch(authStateProvider);

  return auth.maybeWhen(
    data: (user) {
      if (user == null) return 0;

      final cartAsync = ref.watch(cartStreamProvider(user.uid));
      return cartAsync.value?.length ?? 0;
    },
    orElse: () => 0,
  );
});
