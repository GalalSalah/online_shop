import 'package:flutter/cupertino.dart';

class CartAttribute with ChangeNotifier {
  final String id;
  final String title;
  final String imageUrl;
  final double price;
  final int quantity;

  CartAttribute({
    this.id,
    this.title,
    this.imageUrl,
    this.price,
    this.quantity,
  });
}
