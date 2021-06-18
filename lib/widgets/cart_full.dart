import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:online_shop/conts/colors_const.dart';
import 'package:online_shop/inner_screens/product_details.dart';
import 'package:online_shop/models/cart_attribute.dart';
import 'package:online_shop/provider/cart_provider.dart';
import 'package:online_shop/provider/dark_theme.dart';
import 'package:provider/provider.dart';

class CartFull extends StatefulWidget {
  final String productId;

  const CartFull({this.productId});

  @override
  _CartFullState createState() => _CartFullState();
}

class _CartFullState extends State<CartFull> {
  @override
  Widget build(BuildContext context) {
    final cartAttribute = Provider.of<CartAttribute>(context);
    final themeChange = Provider.of<DarkThemeProvider>(context);
    double subTotal = cartAttribute.price * cartAttribute.quantity;
    final cartProvider = Provider.of<CartProvider>(context);
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, ProductDetails.routeName,
            arguments: widget.productId);
      },
      child: Container(
        height: 135,
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(14),
            topRight: Radius.circular(14),
          ),
          color: Theme.of(context).backgroundColor,
        ),
        child: Row(
          children: [
            Container(
              width: 130,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(cartAttribute.imageUrl),
                ),
              ),
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            cartAttribute.title,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 15),
                          ),
                        ),
                        Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {
                              cartProvider.showDialogText(
                                  'Remove Product',
                                  'Are you sure to remove this product',
                                  cartProvider.removeItem(widget.productId),
                                  context);
                            },
                            borderRadius: BorderRadius.circular(32),
                            child: Container(
                              height: 50,
                              width: 50,
                              child: Icon(
                                Entypo.cross,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text('Price'),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          '${cartAttribute.price} \$',
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 16),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text('Sub Price'),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          '${subTotal.toStringAsFixed(2)} \$',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: themeChange.darkTheme
                                  ? Colors.brown.shade500
                                  : Theme.of(context).accentColor),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'Ships Free',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: themeChange.darkTheme
                                  ? Colors.brown.shade500
                                  : Theme.of(context).accentColor),
                        ),
                        Spacer(),
                        Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: cartAttribute.quantity < 2
                                ? null
                                : () {
                                    cartProvider
                                        .reduceItemByOne(widget.productId);
                                  },
                            borderRadius: BorderRadius.circular(4),
                            child: Container(
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Icon(
                                  Entypo.minus,
                                  color: cartAttribute.quantity < 2
                                      ? Colors.grey
                                      : Colors.red,
                                ),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: (){},
                          child: Card(
                            elevation: 12,
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.12,
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                gradient: LinearGradient(colors: [
                                  ColorsConsts.starterColor,
                                  ColorsConsts.endColor,
                                ], stops: [
                                  0.0,
                                  0.7
                                ]),
                              ),
                              child: Text(
                                '${cartAttribute.quantity.toString()}',
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                        Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {
                              cartProvider.addProductToCart(
                                  cartAttribute.title,
                                  cartAttribute.imageUrl,
                                  cartAttribute.price,
                                  widget.productId);
                            },
                            borderRadius: BorderRadius.circular(4),
                            child: Container(
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Icon(
                                  Entypo.plus,
                                  color: Colors.green,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
