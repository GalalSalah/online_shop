import 'package:flutter/cupertino.dart';

class FavAttribute with ChangeNotifier {
  final String id;
  final String title;
  final String imageUrl;
  final double price;


  FavAttribute({
    this.id,
    this.title,
    this.imageUrl,
    this.price,

  });
}
