import 'package:flutter/material.dart';

class CartItemTile extends StatelessWidget {
  const CartItemTile(
      {Key? key,
      required this.id,
      required this.price,
      required this.quantity,
      required this.title})
      : super(key: key);
  final String id;
  final int price;
  final int quantity;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Card(
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
    );
  }
}
