import 'package:flutter/material.dart';
import 'package:shop_app_provider/models/product.dart';
import 'package:shop_app_provider/widgets/products_grid.dart';

enum FilterOptions {
  favorites,
  all,
}

class ProductOverviewScreen extends StatefulWidget {
  @override
  _ProductOverviewScreenState createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  final List<Product> loadedProducts = [];
  var isFavoriteSelected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shop app'),
        actions: [
          PopupMenuButton(
            icon: Icon(Icons.more_vert),
            onSelected: (FilterOptions selectedValue) {
              if (selectedValue == FilterOptions.favorites) {
                setState(() {
                  isFavoriteSelected = true;
                });
              } else {
                setState(() {
                  isFavoriteSelected = false;
                });
              }
            },
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text('Only Favorites'),
                value: FilterOptions.favorites,
              ),
              PopupMenuItem(
                child: Text('Show All'),
                value: FilterOptions.all,
              ),
            ],
          )
        ],
      ),
      body: ProductsGrid(isFavoriteSelected),
    );
  }
}
