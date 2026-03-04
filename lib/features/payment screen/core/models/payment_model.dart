import 'package:sneakcom_ecom/features/buynow/core/models/buy_now_nodel.dart';

class CheckoutModel {
  final double subtotal;
  final double platformFee;
  final double deliveryFee;
  final double total;
  final List<BuyNowItem> items;

  CheckoutModel({
    required this.subtotal,
    required this.platformFee,
    required this.deliveryFee,
    required this.total,
    required this.items,
  });
}
