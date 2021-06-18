import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:online_shop/conts/colors_const.dart';
import 'package:online_shop/conts/my_icon.dart';
import 'package:online_shop/inner_screens/product_details.dart';
import 'package:online_shop/provider/cart_provider.dart';
import 'package:online_shop/provider/dark_theme.dart';
import 'package:online_shop/provider/fav_provider.dart';
import '../provider/product.dart';
import 'package:provider/provider.dart';

class FeedDialog extends StatelessWidget {
  final String productId;

  const FeedDialog({Key key, this.productId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Products>(context, listen: false);
    final cartProvider = Provider.of<CartProvider>(context);
    final favProvider = Provider.of<FavProvider>(context);
    final productAttribute = productData.findById(productId);
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              constraints: BoxConstraints(
                  minHeight: 100,
                  minWidth: MediaQuery.of(context).size.height * 0.5),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor),
              child: Image.network(productAttribute.imageUrl,fit: BoxFit.contain,),
            ),
            Container(
              color: Theme.of(context).scaffoldBackgroundColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Flexible(
                    child: dialogContent(
                      context,
                      0,
                      () => {
                        favProvider.addAndRemoveFav(
                          productId,
                          productAttribute.title,
                          productAttribute.price,
                          productAttribute.imageUrl,
                        ),
                        // Navigator.canPop(context)
                        //     ? Navigator.pop(context)
                        //     : null,
                      },
                    ),
                  ),
                  Flexible(
                    child: dialogContent(
                        context,
                        1,
                        () => {
                              Navigator.pushNamed(
                                context,
                                ProductDetails.routeName,
                                arguments: productAttribute.id,
                              ).then((value) => Navigator.canPop(context)
                                  ? Navigator.pop(context)
                                  : null)
                            }),
                  ),
                  Flexible(
                    child: dialogContent(
                      context,
                      2,
                      () => {
                        cartProvider.addProductToCart(
                          productId,
                          productAttribute.title,
                          productAttribute.price,
                          productAttribute.imageUrl,
                        ),
                        // Navigator.canPop(context)
                        //     ? Navigator.pop(context)
                        //     : null,
                      },
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(8),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white,
                  width: 1.3,
                ),
                shape: BoxShape.circle,
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () =>
                      Navigator.canPop(context) ? Navigator.pop(context) : null,
                  borderRadius: BorderRadius.circular(30),
                  splashColor: Colors.grey,
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Icon(
                      Icons.close,
                      size: 25,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget dialogContent(BuildContext context, int index, Function fct) {
    final cart = Provider.of<CartProvider>(context);
    final fav = Provider.of<FavProvider>(context);
    List<IconData> _dialogIcons = [
      fav.getFavItems.containsKey(productId)
          ? Icons.favorite
          : Icons.favorite_border,
      Feather.eye,
      MyAppIcons.cart,
    ];
    List<String> _texts = [
      fav.getFavItems.containsKey(productId)
          ? 'In Wishlist'
          : 'Add to Wishlist',
      'View Product',
      cart.getCartItems.containsKey(productId) ? 'In Cart' : 'Att to Cart',
    ];
    List<Color> _colors = [
      fav.getFavItems.containsKey(productId)
          ? Colors.red
          : Theme.of(context).textSelectionColor,
      Theme.of(context).textSelectionColor,
      Theme.of(context).textSelectionColor,
    ];
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return FittedBox(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: fct,
          splashColor: Colors.grey,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.25,
            padding: EdgeInsets.all(4),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).backgroundColor,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 10,
                          offset: const Offset(0.0, 10.0),
                        )
                      ]),
                  child: ClipOval(
                    child: SizedBox(
                      width: 50,
                      height: 50,
                      child: Icon(
                        _dialogIcons[index],
                        color: _colors[index],
                        size: 25,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(5),
                  child: FittedBox(
                    child: Text(
                      _texts[index],
                      maxLines: 1,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.w800,
                          color: themeChange.darkTheme
                              ? Theme.of(context).disabledColor
                              : ColorsConsts.subTitle),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
