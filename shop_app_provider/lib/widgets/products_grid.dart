import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_provider/models/products.dart';
import 'package:shop_app_provider/widgets/product_item.dart';

class ProductsGrid extends StatelessWidget {
  final bool isFavoriteSelected;

  ProductsGrid(this.isFavoriteSelected);

  @override
  Widget build(BuildContext context) {
    final loadedProducts = isFavoriteSelected
        ? Provider.of<Products>(context).favoritesOnly
        : Provider.of<Products>(context).items;

    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: loadedProducts.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 3 / 3,
      ),
      itemBuilder: (context, item) => ChangeNotifierProvider.value(
        value: loadedProducts[item],
        child: ProductItem(),
      ),
    );
  }
}
