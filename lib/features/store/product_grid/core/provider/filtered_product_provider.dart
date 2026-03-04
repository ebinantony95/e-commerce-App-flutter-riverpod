import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sneakcom_ecom/features/store/menu_section/core/providers/selected_brand_provider.dart';
import 'package:sneakcom_ecom/features/store/product_grid/core/model/product_model.dart';

final filteredProductProvider = StreamProvider<List<ProductModel>>((ref) {
  //state provider to know which brand selected
  final selectedbrand = ref.watch(selectedBrandProvider);

  // firestore instance of collection-products
  final collection = FirebaseFirestore.instance.collection('products');
  if (selectedbrand == null) {
    //if null show all
    return collection.snapshots().map((snapshot) {
      return snapshot.docs
          .map((doc) => ProductModel.fromSnapshot(doc))
          .toList();
    });
  } else {
    // else show brand wise
    return collection.where('brand', isEqualTo: selectedbrand).snapshots().map((
      snapshot,
    ) {
      return snapshot.docs
          .map((doc) => ProductModel.fromSnapshot(doc))
          .toList();
    });
  }
});
