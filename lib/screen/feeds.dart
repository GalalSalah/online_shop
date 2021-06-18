import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import '../conts/colors_const.dart';
import '../conts/my_icon.dart';
import '../models/product.dart';
import '../provider/cart_provider.dart';
import '../provider/fav_provider.dart';
import '../provider/product.dart';
import 'wishlist.dart';
import '../widgets/feeds_products.dart';
import 'package:provider/provider.dart';
import 'cart.dart';

class Feeds extends StatelessWidget {
  Feeds({Key key}) : super(key: key);
  static const routeName = '/feeds';

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<Products>(context);
    List<Product> productList = productProvider.products;
    String popular = ModalRoute.of(context).settings.arguments as String;
    if (popular == 'popular') {
      productList = productProvider.popularProducts;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Feeds'),
        actions: [
          Consumer<FavProvider>(
            builder: (_, fav, ch) => Badge(
              badgeColor: ColorsConsts.cartBadgeColor,
              animationType: BadgeAnimationType.slide,
              position: BadgePosition.topEnd(top: 7, end: 5),
              toAnimate: true,
              badgeContent: Text(
                fav.getFavItems.length.toString(),
                style: TextStyle(color: Colors.white),
              ),
              child: IconButton(
                icon: Icon(MyAppIcons.wishlist),
                onPressed: () {
                  Navigator.pushNamed(context, Wishlist.routeName);
                },
                color: ColorsConsts.favColor,
              ),
            ),
          ),
          Consumer<CartProvider>(
            builder: (_, cart, ch) => Badge(
              badgeColor: ColorsConsts.cartBadgeColor,
              animationType: BadgeAnimationType.fade,
              position: BadgePosition.topEnd(top: 7, end: 5),
              toAnimate: true,
              badgeContent: Text(
                cart.getCartItems.length.toString(),
                style: TextStyle(color: Colors.white),
              ),
              child: IconButton(
                icon: Icon(MyAppIcons.cart),
                onPressed: () {
                  Navigator.pushNamed(context, Cart.routeName);
                },
                color: ColorsConsts.cartColor,
              ),
            ),
          ),
        ],
      ),
      body: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 240 / 460,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        children: List.generate(
            productList.length,
            (index) => ChangeNotifierProvider.value(
                  value: productList[index],
                  child: FeedsProducts(
                      // id: productList[index].id,
                      // description: productList[index].description,
                      // price: productList[index].price,
                      // imageUrl: productList[index].imageUrl,
                      // isFavourite: productList[index].isFavourite,
                      // quantity: productList[index].quantity,
                      ),
                )),
      ),
      // StaggeredGridView.countBuilder(
      //   padding: EdgeInsets.all(5),
      //   crossAxisCount: 4,
      //
      //   itemCount: _products.length,
      //   itemBuilder: (BuildContext context, int index) => FeedsProducts(
      //     id: _products[index].id,
      //     description: _products[index].description,
      //     price: _products[index].price,
      //     imageUrl: _products[index].imageUrl,
      //     isFavourite: _products[index].isFavourite,
      //     quantity: _products[index].quantity,
      //   ),
      //   staggeredTileBuilder: (int index) =>
      //       new StaggeredTile.count(2, index.isEven ? 3 : 4),
      //   mainAxisSpacing: 4.0,
      //   crossAxisSpacing: 4.0,
      //
      // ),
    );

    //   GridView.count(
    //   crossAxisCount: 2,
    //   childAspectRatio: 240 / 290,
    //   crossAxisSpacing: 8,
    //   mainAxisSpacing: 8,
    //   children: List.generate(100, (index) => FeedsProducts()),
    // );
  }
}
