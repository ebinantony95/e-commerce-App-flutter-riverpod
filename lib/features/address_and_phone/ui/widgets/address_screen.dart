import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sneakcom_ecom/features/address_and_phone/core/models/address_model.dart';
import 'package:sneakcom_ecom/features/address_and_phone/core/service/save_address.dart';

class AddressScreen extends ConsumerStatefulWidget {
  const AddressScreen({super.key});

  @override
  ConsumerState<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends ConsumerState<AddressScreen> {
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();
  final cityController = TextEditingController();
  final pincodeController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    addressController.dispose();
    cityController.dispose();
    pincodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Address & Phone")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // Full Name
              TextFormField(
                controller: nameController,
                decoration: _inputDecoration("Full Name", Icons.person_outline),
                validator: (value) => value!.isEmpty ? "Enter your name" : null,
              ),

              const SizedBox(height: 16),

              // Phone
              TextFormField(
                controller: phoneController,
                keyboardType: TextInputType.phone,
                decoration: _inputDecoration(
                  "Phone Number",
                  Icons.phone_outlined,
                ),
                validator: (value) =>
                    value!.length < 10 ? "Enter valid phone" : null,
              ),

              const SizedBox(height: 16),

              // Address
              TextFormField(
                controller: addressController,
                maxLines: 3,
                decoration: _inputDecoration(
                  "Address Line",
                  Icons.home_outlined,
                ),
                validator: (value) => value!.isEmpty ? "Enter address" : null,
              ),

              const SizedBox(height: 16),

              // City
              TextFormField(
                controller: cityController,
                decoration: _inputDecoration(
                  "City",
                  Icons.location_city_outlined,
                ),
                validator: (value) => value!.isEmpty ? "Enter city" : null,
              ),

              const SizedBox(height: 16),

              // Pincode
              TextFormField(
                controller: pincodeController,
                keyboardType: TextInputType.number,
                decoration: _inputDecoration("Pincode", Icons.pin_outlined),
                validator: (value) =>
                    value!.length < 5 ? "Enter valid pincode" : null,
              ),

              const SizedBox(height: 30),

              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      final address = AddressModel(
                        name: nameController.text.trim(),
                        phone: phoneController.text.trim(),
                        addressLine:
                            "${addressController.text}, ${cityController.text} - ${pincodeController.text}",
                      );

                      await saveAddress(address);

                      context.pop();
                    }
                  },
                  child: const Text(
                    "Save Address",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  InputDecoration _inputDecoration(String label, IconData icon) {
    return InputDecoration(
      labelText: label,
      prefixIcon: Icon(icon),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(width: 1.5),
      ),
    );
  }
}
