import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:online_shop/models/fav_attribute.dart';

class FavProvider with ChangeNotifier {
  Map<String, FavAttribute> _favItems = {};

  Map<String, FavAttribute> get getFavItems {
    return _favItems;
  }

  void addAndRemoveFav(
      String favId, String title, double price, String imageUrl) {
    if (_favItems.containsKey(favId)) {
      removeItem(favId);
    } else {
      _favItems.putIfAbsent(
          favId,
          () => FavAttribute(
                id: DateTime.now().toString(),
                imageUrl: imageUrl,
                price: price,
                title: title,
              ));
    }
    notifyListeners();
  }

  removeItem(String productId) {
    _favItems.remove(productId);
    // notifyListeners();
  }

  clearWish() {
    _favItems.clear();
    // notifyListeners();
  }

  Future<dynamic> showDialogTextFav(
      String title, String subTitle, Function fct, BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
            children: [
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: Image.network('src',width: 20,height: 20,),
              // ),
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
