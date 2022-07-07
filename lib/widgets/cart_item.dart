import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cart.dart';

class CartItemTile extends StatelessWidget {
  const CartItemTile(
      {Key? key,
      required this.id,
      required this.productId,
      required this.price,
      required this.quantity,
      required this.title})
      : super(key: key);
  final String id;
  final String productId;
  final int price;
  final int quantity;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      // Dismissibleにすることで削除可能に
      key: ValueKey(id),
      background: Container(
        color: Theme.of(context).errorColor,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 25),
        margin: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 4.0),
        child: const Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
      ),
      direction: DismissDirection.endToStart,
      confirmDismiss: (direction) {
        return showDialog(
          context: context,
          builder: (ctx) {
            return AlertDialog(
              title: Text(
                'Are you sure?',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              content: Text(
                'Do you wat to remove the item from the cart?',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              actions: [
                TextButton(
                  child: const Text('No'),
                  onPressed: () {
                    Navigator.of(ctx).pop(false);
                  },
                ),
                TextButton(
                  child: const Text('Yes'),
                  onPressed: () {
                    Navigator.of(ctx).pop(true);
                  },
                ),
              ],
            );
          },
        );
      },
      onDismissed: (_) {
        Provider.of<Cart>(context, listen: false).removeItem(productId);
      },
      child: Card(
        margin: const EdgeInsets.symmetric(
          horizontal: 15.0,
          vertical: 4.0,
        ),
        elevation: 6,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Theme.of(context).colorScheme.primary,
              child: FittedBox(
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    '\$$price',
                    style: TextStyle(
                      color: Theme.of(context).textTheme.labelMedium?.color,
                    ),
                  ),
                ),
              ),
            ),
            title: Text(
              title,
              style: Theme.of(context).textTheme.labelLarge,
            ),
            subtitle: Text(
              'Total: \$${price * quantity}',
              style: TextStyle(color: Colors.grey.shade700),
            ),
            trailing: Text('$quantity x'),
          ),
        ),
      ),
    );
  }
}
