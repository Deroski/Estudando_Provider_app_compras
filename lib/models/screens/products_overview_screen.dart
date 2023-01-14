import 'package:flutter/material.dart';

import '../../components/product_grid.dart';

class ProductsOverviewScreen extends StatelessWidget {
  ProductsOverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Minha loja'),
        ),
      ),
      body: ProductGrid(),
    );
  }
}
