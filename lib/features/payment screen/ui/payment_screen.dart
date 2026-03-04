import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sneakcom_ecom/features/payment%20screen/core/models/payment_model.dart';
import 'package:sneakcom_ecom/features/payment%20screen/core/provider/user_provider.dart';
import 'package:sneakcom_ecom/features/payment%20screen/ui/payment_success_message.dart';
import 'package:sneakcom_ecom/util/constants/colors.dart';

class PaymentScreen extends ConsumerStatefulWidget {
  final CheckoutModel checkout;

  const PaymentScreen({super.key, required this.checkout});

  @override
  ConsumerState<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends ConsumerState<PaymentScreen> {
  String selectedPayment = "UPI";

  final List<String> paymentMethods = [
    "UPI",
    "Credit Card",
    "Debit Card",
    "Cash on Delivery",
  ];

  @override
  Widget build(BuildContext context) {
    final userAsync = ref.watch(userProvider);

    return userAsync.when(
      data: (user) {
        return Scaffold(
          appBar: AppBar(title: const Text("Checkout")),
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// ---------------- CONTACT INFO ----------------
                const Text(
                  "Contact Information",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 12),

                ListTile(
                  leading: const Icon(Icons.person_outline),
                  title: Text(user.address?.name ?? user.name),
                  subtitle: const Text("Full Name"),
                ),

                ListTile(
                  leading: const Icon(Icons.phone_outlined),
                  title: Text(user.address?.phone ?? user.phone ?? ""),
                  subtitle: const Text("Phone"),
                ),

                const Divider(height: 30),

                /// ---------------- ADDRESS ----------------
                const Text(
                  "Address",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 10),

                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(user.address?.addressLine ?? "No address added"),
                ),

                const SizedBox(height: 30),

                /// ---------------- PAYMENT DROPDOWN ----------------
                const Text(
                  "Payment Method",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 10),

                DropdownButtonFormField<String>(
                  initialValue: selectedPayment,
                  items: paymentMethods.map((method) {
                    return DropdownMenuItem(value: method, child: Text(method));
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedPayment = value!;
                    });
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),

                const Spacer(),

                /// ---------------- PRICE SUMMARY ----------------
                Text("MRP: ₹${widget.checkout.subtotal}"),
                Text("Platform Fee: ₹${widget.checkout.platformFee}"),
                Text("Delivery Fee: ₹${widget.checkout.deliveryFee}"),

                const SizedBox(height: 6),

                Text(
                  "Total: ₹${widget.checkout.total}",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 16),

                /// ---------------- PAY BUTTON ----------------
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.addCartColor,
                    ),
                    onPressed: () {
                      // Later we create order here
                      print("Payment: $selectedPayment");
                      showPaymentSuccessDialog(context);
                    },
                    child: const Text(
                      "Pay",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(height: 30),
              ],
            ),
          ),
        );
      },
      loading: () =>
          const Scaffold(body: Center(child: CircularProgressIndicator())),
      error: (e, _) => Scaffold(body: Center(child: Text(e.toString()))),
    );
  }
}
