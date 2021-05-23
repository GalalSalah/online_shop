import 'package:flutter/material.dart';
import 'package:online_shop/models/cart_attribute.dart';

class CartProvider with ChangeNotifier {
  Map<String, CartAttribute> _cartItems = {};

  Map<String, CartAttribute> get getCartItems {
    return _cartItems;
  }

  double get totalAmount {
    double total = 0.0;
    _cartItems.forEach((key, value) {
      total += value.price * value.quantity;
    });
    return total;
  }
  void addProductToCart(String title,String imageUrl,double price,String productId){
    if(_cartItems.containsKey(productId)){
      _cartItems.update(productId, (valueProduct) => CartAttribute(
        id:valueProduct.id,
        imageUrl: valueProduct.imageUrl,
        title: valueProduct.title,
        price: valueProduct.price,
        quantity: valueProduct.quantity*1,
      ));
    }else{
      _cartItems.putIfAbsent(productId, () => CartAttribute(
        id:DateTime.now().toString(),
        imageUrl:imageUrl,
        title: title,
        price: price,
        quantity: 1,
      ));
    }
    notifyListeners();
  }
}
