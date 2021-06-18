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

  void addProductToCart(
      String title, String imageUrl, double price, String productId) {
    if (_cartItems.containsKey(productId)) {
      _cartItems.update(
          productId,
          (valueProduct) => CartAttribute(
                id: valueProduct.id,
                imageUrl: valueProduct.imageUrl,
                title: valueProduct.title,
                price: valueProduct.price,
                quantity: valueProduct.quantity + 1,
              ));
    } else {
      _cartItems.putIfAbsent(
          productId,
          () => CartAttribute(
                id: DateTime.now().toString(),
                imageUrl: imageUrl,
                title: title,
                price: price,
                quantity: 1,
              ));
    }
    notifyListeners();
  }

  void reduceItemByOne(String productId) {
    if (_cartItems.containsKey(productId)) {
      _cartItems.update(
          productId,
          (value) => CartAttribute(
                id: value.id,
                imageUrl: value.imageUrl,
                price: value.price,
                quantity: value.quantity - 1,
                title: value.title,
              ));
      notifyListeners();
    }
  }

  removeItem(String productId) {
    _cartItems.remove(productId);
    // notifyListeners();
  }

  clearCart() {
    _cartItems.clear();
    // notifyListeners();
  }

  Future<dynamic> showDialogText(
      String title, String subTitle, Function fct, BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.network(
                  'https://image.flaticon.com/icons/png/128/564/564619.png',
                  width: 20,
                  height: 20,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(title),
              ),
            ],
          ),
          content: Text(subTitle),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('canceled'),
            ),
            TextButton(
                onPressed: () {
                  fct;
                  Navigator.pop(context);
                  notifyListeners();
                },
                child: Text('ok')),
          ],
        );
      },
    );
    // notifyListeners();
  }
}
