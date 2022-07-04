import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../pages/product_detail_page.dart';
import '../providers/product.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          leading: IconButton(
            onPressed: () => product.toggleFavoriteStatus(),
            icon: product.isFavorite
                ? Icon(
                    Icons.favorite,
                    color: Theme.of(context).colorScheme.secondary,
                  )
                : Icon(
                    Icons.favorite_border,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
          ),
          trailing: IconButton(
            onPressed: () => product.toggleFavoriteStatus(),
            icon: Icon(
              Icons.shopping_cart,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          title: Text(
            product.title,
            textAlign: TextAlign.center,
          ),
        ),
        child: GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(ProductDetailPage.routeName,
                  arguments: product.id);
            },
            child: Image.network(product.imageUrl, fit: BoxFit.cover)),
      ),
    );
  }
}
