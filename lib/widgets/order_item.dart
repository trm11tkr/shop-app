import 'dart:math';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../providers/orders.dart';

class OrderItemTile extends StatefulWidget {
  const OrderItemTile({Key? key, required this.order}) : super(key: key);

  final OrderItem order;

  @override
  State<OrderItemTile> createState() => _OrderItemTileState();
}

class _OrderItemTileState extends State<OrderItemTile> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            ListTile(
              title: Text(
                '\$${widget.order.amount}',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              subtitle: Text(
                DateFormat('dd/MM/yyy/hh:mm').format(widget.order.dateTime),
                style: TextStyle(fontSize: 18),
              ),
              trailing: IconButton(
                icon: Icon(_expanded ? Icons.expand_less : Icons.expand_more),
                onPressed: () {
                  setState(() {
                    _expanded = !_expanded;
                  });
                },
              ),
            ),
            if (_expanded)
              Column(
                children: [
                  const Divider(
                    height: 0,
                    thickness: 2,
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 15),
                    height: min(widget.order.products.length * 20 + 10, 180),
                    child: ListView(
                      children: widget.order.products
                          .map(
                            (product) => Row(
                              children: [
                                Text(
                                  product.title,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontFamily: 'KantumruyPro',
                                  ),
                                ),
                                const SizedBox(width: 5.0),
                                Text(
                                  ': ${product.quantity}x \$${product.price}',
                                  style: const TextStyle(
                                    fontSize: 18,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ],
              ),
          ],
        ));
  }
}
