import 'package:flutter/material.dart';

import '../widgets/products_grid.dart';

class ProductOverViewPage extends StatelessWidget {
  const ProductOverViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyShop'),
      ),
      body:const ProductsGrid(),
    );
  }
}