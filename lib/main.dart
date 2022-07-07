import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './config/custom_theme_data.dart';
import './pages/products_overview_page.dart';
import './pages/product_detail_page.dart';
import './providers/products.dart';
import './providers/cart.dart';
import './providers/orders.dart';
import './pages/cart_page.dart';
import './pages/orders_page.dart';
import './pages/user_products_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: ((context) => Products()),
        ),
        ChangeNotifierProvider(
          create: ((context) => Cart()),
        ),
        ChangeNotifierProvider(
          create: ((context) => Orders()),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: customLightThemeData,
        darkTheme: customDarkThemeData,
        home: const ProductOverViewPage(),
        routes: {
          ProductDetailPage.routeName: (context) => const ProductDetailPage(),
          CartPage.routeName: (context) => const CartPage(),
          OrdersPage.routeName: (context) => const OrdersPage(),
          UserProductsPage.routeName: (context) => const UserProductsPage(),
        },
      ),
    );
  }
}
