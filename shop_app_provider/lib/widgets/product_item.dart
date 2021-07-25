import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_provider/models/product.dart';
import 'package:shop_app_provider/screens/product_detail_screen.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final loadedProduct = Provider.of<Product>(context, listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              ProductDetailScreen.routeName,
              arguments: loadedProduct.id,
            );
          },
          child: Image.network(
            loadedProduct.imageUrl,
            fit: BoxFit.fill,
          ),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black54,
          leading: Consumer<Product>(
              builder: (context, product, child) => IconButton(
                    icon: product.isFavorite
                        ? Icon(Icons.favorite)
                        : Icon(Icons.favorite_border),
                    onPressed: () {
                      loadedProduct.toggleFavorite();
                    },
                    color: Theme.of(context).accentColor,
                  )),
          title: Text(loadedProduct.title, textAlign: TextAlign.center),
          trailing: IconButton(
            icon: Icon(Icons.add_shopping_cart),
            onPressed: () {},
            color: Theme.of(context).accentColor,
          ),
        ),
      ),
    );
  }
}
