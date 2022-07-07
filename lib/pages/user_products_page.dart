import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/pages/edit_product_page.dart';

import '../providers/products.dart';
import '../widgets/user_product_item.dart';
import '../widgets/app_drawer.dart';

class UserProductsPage extends StatelessWidget {
  const UserProductsPage({Key? key}) : super(key: key);
  static const routeName = '/user-products';

  @override
  Widget build(BuildContext context) {
    final Products productsData = Provider.of<Products>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Products'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(EditProductPage.routeName);
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      drawer: const AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemBuilder: ((_, index) {
            return Column(
              children: [
                UserProductItem(
                    title: productsData.items[index].title,
                    imageUrl: productsData.items[index].imageUrl),
                const Divider(
                  thickness: 2,
                ),
              ],
            );
          }),
          itemCount: productsData.items.length,
        ),
      ),
    );
  }
}
