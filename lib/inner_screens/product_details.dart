import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:online_shop/conts/colors_const.dart';
import 'package:online_shop/conts/my_icon.dart';
import 'package:online_shop/models/fav_attribute.dart';
import 'package:online_shop/provider/cart_provider.dart';
import 'package:online_shop/provider/dark_theme.dart';
import 'package:online_shop/provider/fav_provider.dart';
import 'package:online_shop/provider/product.dart';
import 'package:online_shop/screen/cart.dart';
import 'package:online_shop/screen/wishlist.dart';
import 'package:online_shop/widgets/feeds_products.dart';
import 'package:provider/provider.dart';

class ProductDetails extends StatefulWidget {
  static const routeName = '/productDetails';

  const ProductDetails({Key key}) : super(key: key);

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  GlobalKey previweContainer = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final productData = Provider.of<Products>(context);
    final productId = ModalRoute.of(context).settings.arguments as String;
    final productList = productData.products;
    final productAttributeId = productData.findById(productId);
    final themeData = Provider.of<DarkThemeProvider>(context);
    final favProvider = Provider.of<FavProvider>(context);

    return Scaffold(
      body: Stack(
        children: [
          Container(
            foregroundDecoration: BoxDecoration(color: Colors.black12),
            height: MediaQuery.of(context).size.height * 0.45,
            width: double.infinity,
            child: Image.network(productAttributeId.imageUrl),
          ),
          SingleChildScrollView(
            padding: const EdgeInsets.only(top: 16, bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 250,
                ),
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          splashColor: Colors.purple.shade200,
                          onTap: () {},
                          borderRadius: BorderRadius.circular(30),
                          child: Padding(
                            padding: EdgeInsets.all(8),
                            child: Icon(
                              Icons.save,
                              size: 23,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          splashColor: Colors.purple.shade200,
                          onTap: () {},
                          borderRadius: BorderRadius.circular(30),
                          child: Padding(
                            padding: EdgeInsets.all(8),
                            child: Icon(
                              Icons.share,
                              size: 23,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.9,
                              child: Text(
                                productAttributeId.title,
                                maxLines: 2,
                                style: TextStyle(
                                  fontSize: 26,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              'US ${productAttributeId.price} \$',
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w600,
                                color: themeData.darkTheme
                                    ? Theme.of(context).disabledColor
                                    : ColorsConsts.subTitle,
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8,
                        ),
                        child: Divider(
                          thickness: 1,
                          color: Colors.grey,
                          height: 1,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: EdgeInsets.all(15),
                        child: Text(
                          productAttributeId.description,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 23,
                            color: themeData.darkTheme
                                ? Theme.of(context).disabledColor
                                : ColorsConsts.subTitle,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: Divider(
                          thickness: 1,
                          height: 1,
                          color: Colors.grey,
                        ),
                      ),
                      _details(themeData.darkTheme, 'Brand: ',
                          productAttributeId.brand),
                      _details(themeData.darkTheme, 'Quantity: ',
                          '${productAttributeId.quantity}'),
                      _details(themeData.darkTheme, 'Category: ',
                          productAttributeId.productCategoryName),
                      _details(
                          themeData.darkTheme,
                          'Popularity: ',
                          productAttributeId.isPopular
                              ? 'Popular'
                              : 'Not Popular'),
                      SizedBox(
                        height: 15,
                      ),
                      Divider(
                        thickness: 1,
                        height: 1,
                        color: Colors.grey,
                      ),
                      Container(
                        width: double.infinity,
                        color: Theme.of(context).backgroundColor,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(
                              height: 15,
                            ),
                            Padding(
                              padding: EdgeInsets.all(8),
                              child: Text(
                                'No reviwes yet',
                                style: TextStyle(
                                  color: Theme.of(context).textSelectionColor,
                                  fontSize: 21,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(2),
                              child: Text(
                                'Be the first reviwe!',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 23,
                                    color: themeData.darkTheme
                                        ? Theme.of(context).disabledColor
                                        : ColorsConsts.subTitle),
                              ),
                            ),
                            SizedBox(
                              height: 70,
                            ),
                            Divider(
                              thickness: 1,
                              height: 1,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(8),
                  color: Theme.of(context).scaffoldBackgroundColor,
                  child: Text(
                    'Suggested Products',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 34),
                  width: double.infinity,
                  height: 350,
                  child: ListView.builder(
                      itemCount: productList.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext ctx, int index) {
                        return ChangeNotifierProvider.value(
                            value: productList[index], child: FeedsProducts());
                      }),
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
              title: Text(
                'Details',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
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
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Container(
                    height: 50,
                    child: RaisedButton(
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      shape: RoundedRectangleBorder(side: BorderSide.none),
                      color: Colors.redAccent.shade400,
                      child: Text(
                        cartProvider.getCartItems.containsKey(productId)
                            ? 'In Cart'
                            : 'Add To Cart'.toUpperCase(),
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                      onPressed:
                          cartProvider.getCartItems.containsKey(productId)
                              ? () {}
                              : () {
                                  cartProvider.addProductToCart(
                                      productAttributeId.title,
                                      productAttributeId.imageUrl,
                                      productAttributeId.price,
                                      productId);
                                },
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    height: 50,
                    child: RaisedButton(
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      shape: RoundedRectangleBorder(side: BorderSide.none),
                      color: Theme.of(context).backgroundColor,
                      child: Row(
                        children: [
                          Text(
                            'buy now'.toUpperCase(),
                            style: TextStyle(
                                fontSize: 14,
                                color: Theme.of(context).textSelectionColor),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Icon(
                            Icons.payment,
                            color: Colors.green.shade700,
                          )
                        ],
                      ),
                      onPressed: () {},
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 50,
                    color: themeData.darkTheme
                        ? Theme.of(context).disabledColor
                        : ColorsConsts.subTitle,
                    child: InkWell(
                      onTap: () {
                        favProvider.addAndRemoveFav(
                            productId,
                            productAttributeId.title,
                            productAttributeId.price,
                            productAttributeId.imageUrl);
                      },
                      child: Center(
                        child: Icon(
                          favProvider.getFavItems.containsKey(productId)
                              ? Icons.favorite
                              : MyAppIcons.wishlist,
                          color: favProvider.getFavItems.containsKey(productId)
                              ? Colors.red
                              : ColorsConsts.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _details(bool themeState, String title, String info) {
    return Padding(
      padding: EdgeInsets.only(top: 15, right: 16, left: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
                color: Theme.of(context).textSelectionColor,
                fontWeight: FontWeight.w600,
                fontSize: 23),
          ),
          Text(
            info,
            style: TextStyle(
                color: themeState
                    ? Theme.of(context).disabledColor
                    : ColorsConsts.subTitle,
                fontWeight: FontWeight.w600,
                fontSize: 23),
          ),
        ],
      ),
    );
  }
}
