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
      child: Column(children: [
        ListTile(
          title: Text(
            '\$${widget.order.amount}',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          subtitle: Text(
            DateFormat('dd/MM/yyy/hh:mm').format(widget.order.dateTime),
          ),
          trailing: IconButton(
            icon: Icon( _expanded ? Icons.expand_less : Icons.expand_more),
            onPressed: () {
              setState(() {
                _expanded = !_expanded;
              });
            },
          ),
        )
      ]),
    );
  }
}
