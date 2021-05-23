import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:online_shop/inner_screens/product_details.dart';
import 'package:online_shop/models/product.dart';
import 'package:online_shop/provider/product.dart';
import 'package:provider/provider.dart';

class FeedsProducts extends StatefulWidget {
  // final String id;
  // final String description;
  // final String imageUrl;
  // final double price;
  // final int quantity;
  // final bool isFavourite;
  //
  // const FeedsProducts(
  //     {Key key,
  //     @required this.id,
  //     @required this.description,
  //     @required this.imageUrl,
  //     @required this.price,
  //     @required this.quantity,
  //     @required this.isFavourite})
  //     : super(key: key);

  @override
  _FeedsProductsState createState() => _FeedsProductsState();
}

class _FeedsProductsState extends State<FeedsProducts> {
  @override
  Widget build(BuildContext context) {
    final productAttribute = Provider.of<Product>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, ProductDetails.routeName,
              arguments: productAttribute.id);
        },
        child: Container(
          width: 250,
          height: 290,
          decoration: BoxDecoration(
            color: Theme.of(context).backgroundColor,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Column(
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(2),
                    child: Container(
                      width: double.infinity,
                      constraints: BoxConstraints(
                          maxHeight: MediaQuery.of(context).size.height * 0.3,
                          minHeight: 100),
                      child: Image.network(
                        productAttribute.imageUrl,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                  Badge(
                    toAnimate: false,
                    shape: BadgeShape.square,
                    badgeColor: Colors.purple,
                    borderRadius:
                        BorderRadius.only(bottomRight: Radius.circular(8)),
                    badgeContent:
                        Text('New', style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.only(left: 5),
                margin: EdgeInsets.only(left: 5, bottom: 2, right: 3),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      productAttribute.description,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w600),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: Text(
                        '\$ ${productAttribute.price}',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w900),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Quantity: ${productAttribute.quantity}',
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                              fontWeight: FontWeight.w600),
                        ),
                        Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {},
                            borderRadius: BorderRadius.circular(18),
                            child: Icon(Icons.more_horiz),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
