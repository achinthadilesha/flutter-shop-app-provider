import 'package:flutter/material.dart';
import 'package:shop_app_provider/models/product.dart';
import 'package:shop_app_provider/widgets/products_grid.dart';

class ProductOverviewScreen extends StatelessWidget {
  final List<Product> loadedProducts = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shop app'),
      ),
      body: ProductsGrid(),
    );
  }
}
