import 'package:flutter/material.dart';
import 'package:online_shop/conts/colors_const.dart';
import 'package:online_shop/models/fav_attribute.dart';
import 'package:online_shop/provider/fav_provider.dart';
import 'package:provider/provider.dart';

class WishlistFull extends StatefulWidget {
  final String productId;

  const WishlistFull({this.productId});

  @override
  _WishlistFullState createState() => _WishlistFullState();
}

class _WishlistFullState extends State<WishlistFull> {
  @override
  Widget build(BuildContext context) {
    final favAttribute = Provider.of<FavAttribute>(context);
    return Stack(
      children: [
        Container(
          width: double.infinity,
          margin: EdgeInsets.only(bottom: 10, right: 30),
          child: Material(
            color: Theme.of(context).backgroundColor,
            borderRadius: BorderRadius.circular(6),
            elevation: 3,
            child: InkWell(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.all(16),
                child: Row(
                  children: [
                    Container(
                      height: 80,
                      child: Image.network(favAttribute.imageUrl),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          favAttribute.title,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          '\$ ${favAttribute.price}',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ))
                  ],
                ),
              ),
            ),
          ),
        ),
        positionedRemove(widget.productId),
      ],
    );
  }

  Widget positionedRemove(String productId) {
    final favProvider = Provider.of<FavProvider>(context);
    return Positioned(
      top: 20,
      right: 16,
      child: Container(
        width: 30,
        height: 30,
        child: MaterialButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          padding: EdgeInsets.all(0.0),
          color: ColorsConsts.favColor,
          child: Icon(
            Icons.clear,
            color: Colors.white,
          ),
          onPressed: () {
            favProvider.showDialogTextFav(
                'Remove a Wish',
                'This product will remove from your Wishlist!',
                favProvider.removeItem(productId),
                context);
          },
        ),
      ),
    );
  }
}
