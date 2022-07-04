import 'package:flutter/foundation.dart';

class Product with ChangeNotifier {
  Product({
    required  this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.imageUrl,
    bool isFavorite = false,
  });

  final String id;
  final String title;
  final String description;
  final int price;
  final String imageUrl;
  bool? isFavorite;
}
