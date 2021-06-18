import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:online_shop/inner_screens/product_details.dart';
import 'package:online_shop/models/product.dart';
import 'package:online_shop/provider/cart_provider.dart';
import 'package:online_shop/provider/fav_provider.dart';
import 'package:provider/provider.dart';

class PopularProduct extends StatelessWidget {
  const PopularProduct({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productAttribute = Provider.of<Product>(context);
    final cartProvider = Provider.of<CartProvider>(context);
    final favProvider = Provider.of<FavProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 250,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(10),
            bottomLeft: Radius.circular(10),
          ),
          color: Theme.of(context).backgroundColor,
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
            ),
            onTap: () {
              Navigator.pushNamed(context, ProductDetails.routeName,
                  arguments: productAttribute.id);
            },
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      height: 170,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(productAttribute.imageUrl),
                            fit: BoxFit.contain),
                      ),
                    ),
                    Positioned(
                      top: 10,
                      right: 10,
                      child: Icon(
                        favProvider.getFavItems.containsKey(productAttribute.id)
                            ? Entypo.star
                            : Entypo.star_outlined,
                        color: favProvider.getFavItems
                                .containsKey(productAttribute.id)
                            ? Colors.red
                            : Colors.grey.shade800,
                      ),
                    ),
                    // Positioned(
                    //     top: 7,
                    //     right: 10,
                    //     child: Icon(
                    //       Entypo.star,
                    //         color: favProvider.getFavItems
                    //                     .containsKey(productAttribute.id)
                    //                 ? Colors.red
                    //                 : Colors.grey.shade800,
                    //       // color: Colors.grey.shade800,
                    //     )),
                    Positioned(
                        bottom: 32,
                        right: 12,
                        child: Container(
                          padding: EdgeInsets.all(10),
                          color: Theme.of(context).backgroundColor,
                          child: Text(
                            '\$ ${productAttribute.price}',
                            style: TextStyle(
                                color: Theme.of(context).textSelectionColor),
                          ),
                        )),
                  ],
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        productAttribute.title,
                        maxLines: 1,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 4,
                            child: Text(
                              productAttribute.description,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15,
                                  color: Colors.grey[800]),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                borderRadius: BorderRadius.circular(30),
                                onTap: cartProvider.getCartItems
                                        .containsKey(productAttribute.id)
                                    ? () {}
                                    : () {
                                        cartProvider.addProductToCart(
                                            productAttribute.title,
                                            productAttribute.imageUrl,
                                            productAttribute.price,
                                            productAttribute.id);
                                      },
                                child: Padding(
                                    padding: EdgeInsets.all(8),
                                    child: Icon(
                                      cartProvider.getCartItems
                                              .containsKey(productAttribute.id)
                                          ? MaterialCommunityIcons.check_all
                                          : MaterialCommunityIcons.cart_plus,
                                      size: 25,
                                      color: Colors.black,
                                    )
                                    // cartProvider.getCartItems
                                    //         .containsKey(productAttribute.id)
                                    //     ? MaterialCommunityIcons.check_all
                                    //     : Icon(
                                    //         MaterialCommunityIcons.cart_plus,
                                    //         size: 25,
                                    //         color: Colors.black,
                                    //       ),
                                    ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
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
