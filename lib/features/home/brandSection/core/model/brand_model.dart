import 'package:sneakcom_ecom/util/constants/images.dart';

class BrandModel {
  final String name;
  final String logo;

  BrandModel({required this.name, required this.logo});
}

final List<BrandModel> brands = [
  BrandModel(name: "Nike", logo: Myimages.nike),
  BrandModel(name: "Adidas", logo: Myimages.adidas),
  BrandModel(name: "Puma", logo: Myimages.puma),
  BrandModel(name: "Reebok", logo: Myimages.reebok),
  BrandModel(name: "New Balance", logo: Myimages.newbalance),
  BrandModel(name: "Converse", logo: Myimages.converse),
];
