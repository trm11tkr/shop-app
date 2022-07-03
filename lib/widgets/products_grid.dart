import 'package:flutter/material.dart';

import '../models/product.dart';
import './product_item.dart';

class ProductsGrid extends StatelessWidget {
  const ProductsGrid({
    Key? key,
    required this.loadedProducts,
  }) : super(key: key);

  final List<Product> loadedProducts;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
      ),
      itemBuilder: (context, index) {
        return ProductItem(product: loadedProducts[index]);
      },
      itemCount: loadedProducts.length,
    );
  }
}