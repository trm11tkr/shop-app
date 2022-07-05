import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cart.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

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
              children: [
                const Text(
                  'Total: ',
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(width: 10),
                Chip(
                  label: Text(
                    '\$${cart.totalAmount}',
                  ),
                  backgroundColor: Theme.of(context).primaryColor,
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
