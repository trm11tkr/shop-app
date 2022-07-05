import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cart.dart';
import '../widgets/cart_item.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);
  static const routeName = '/cart';

  @override
  Widget build(BuildContext context) {
    final Cart cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart'),
      ),
      body: Column(children: [
        Card(
          margin: const EdgeInsets.all(15),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Total: ',
                  style: TextStyle(fontSize: 20),
                ),
                const Spacer(),
                Chip(
                  label: Text('\$${cart.totalAmount}',
                      style: TextStyle(
                          color:
                              Theme.of(context).textTheme.labelMedium?.color)),
                  backgroundColor: Theme.of(context).colorScheme.primary,
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'ORDER NOW',
                    style:
                        TextStyle(color: Theme.of(context).colorScheme.primary, fontSize: 15),
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return CartItemTile(
                id: cart.items.values.toList()[index].id,
                title: cart.items.values.toList()[index].title,
                quantity: cart.items.values.toList()[index].quantity,
                price: cart.items.values.toList()[index].price ,
              );
            },
            itemCount: cart.itemCount,
          ),
        ),
      ]),
    );
  }
}
