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
import './pages/edit_product_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // 商品
        ChangeNotifierProvider(
          create: ((context) => Products()),
        ),
        // カート
        ChangeNotifierProvider(
          create: ((context) => Cart()),
        ),
        // 注文
        ChangeNotifierProvider(
          create: ((context) => Orders()),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: customLightThemeData,
        darkTheme: customDarkThemeData,
        home: const ProductOverViewPage(),
        // ルートの定義
        routes: {
          ProductDetailPage.routeName: (context) => const ProductDetailPage(),
          CartPage.routeName: (context) => const CartPage(),
          OrdersPage.routeName: (context) => const OrdersPage(),
          UserProductsPage.routeName: (context) => const UserProductsPage(),
          EditProductPage.routeName: (context) => const EditProductPage(),
        },
      ),
    );
  }
}
