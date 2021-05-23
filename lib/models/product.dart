import 'package:flutter/cupertino.dart';

class Product with ChangeNotifier{
  final String id;
  final String title;
  final String description;
  final String productCategoryName;
  final String imageUrl;
  final double price;
  final String brand;
  final int quantity;
  final bool isFavourite;
  final bool isPopular;

  Product({
      this.id,
      this.title,
      this.description,
      this.productCategoryName,
      this.imageUrl,
      this.price,
      this.brand,
      this.quantity,
      this.isFavourite,
      this.isPopular});
}
