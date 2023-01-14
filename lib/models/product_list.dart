import 'package:flutter/material.dart';
import 'package:shop_app_flutter/models/product.dart';
import '../data/dummy_data.dart';

class ProductList with ChangeNotifier {
  List<Product> _items = dummyProducts;

  List<Product> get items => [..._items];

  void addProduct(Product product) {
    _items.add(product);
    notifyListeners();
  }
}
