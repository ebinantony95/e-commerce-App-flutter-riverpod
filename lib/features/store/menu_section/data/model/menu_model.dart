import 'package:sneakcom_ecom/util/constants/images.dart';

class MenuModel {
  final String name;
  final String logo;

  MenuModel({required this.name, required this.logo});
}

final List<MenuModel> menu = [
  MenuModel(name: 'All', logo: Myimages.menu),
  MenuModel(name: "nike", logo: Myimages.nike),
  MenuModel(name: "adidas", logo: Myimages.adidas),
  MenuModel(name: "puma", logo: Myimages.puma),
  MenuModel(name: "reebok", logo: Myimages.reebok),
  MenuModel(name: "newbalance", logo: Myimages.newbalance),
  MenuModel(name: "converse", logo: Myimages.converse),
];
