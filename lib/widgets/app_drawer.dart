import 'package:flutter/material.dart';

import '../pages/orders_page.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: [
        AppBar(
          title: const Text('Hello Friend!'),
          automaticallyImplyLeading: false,
        ),
        const Divider(),
        ListTile(
          leading: Icon(Icons.shop),
          title: Text(
            'Shop',
            style: Theme.of(context).appBarTheme.toolbarTextStyle,
          ),
          onTap: () {
            Navigator.of(context).pushNamed('/');
          },
        ),
        const Divider(),
        ListTile(
          leading: const Icon(Icons.payment),
          title: Text(
            'Orders',
            style: Theme.of(context).appBarTheme.toolbarTextStyle,
          ),
          onTap: () {
            Navigator.of(context).pushNamed(OrdersPage.routeName);
          },
        ),
      ]),
    );
  }
}
