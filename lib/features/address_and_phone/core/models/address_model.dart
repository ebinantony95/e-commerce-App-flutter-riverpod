class AddressModel {
  final String name;
  final String phone;
  final String addressLine;

  AddressModel({
    required this.name,
    required this.phone,
    required this.addressLine,
  });

  Map<String, dynamic> toMap() {
    return {"name": name, "phone": phone, "addressLine": addressLine};
  }

  factory AddressModel.fromMap(Map<String, dynamic> map) {
    return AddressModel(
      name: map["name"] ?? "",
      phone: map["phone"] ?? "",
      addressLine: map["addressLine"] ?? "",
    );
  }
}
