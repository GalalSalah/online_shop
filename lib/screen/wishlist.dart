import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:online_shop/conts/colors_const.dart';
import 'package:online_shop/conts/my_icon.dart';
import 'package:online_shop/widgets/cart_empty.dart';
import 'package:online_shop/widgets/wishlist_empty.dart';
import 'package:online_shop/widgets/wishlist_full.dart';

class Wishlist extends StatelessWidget {
  const Wishlist({Key key}) : super(key: key);
  static const routeName = '/wishlist';

  @override
  Widget build(BuildContext context) {
    // ignore: non_constant_identifier_names
    List WishlistList = [];
    return WishlistList.isEmpty
        ? Scaffold(body: WishlistEmpty())
        : Scaffold(
            appBar: AppBar(
              title: Text('Cart Items Count'),
              actions: [
                IconButton(icon: Icon(MyAppIcons.trash), onPressed: () {})
              ],
            ),
            body: ListView.builder(
              itemCount: 2,
              itemBuilder: (BuildContext context, int index) {
                return WishlistFull();
              },
            ),
          );
  }

  Widget checkOutSection(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: Colors.grey, width: 0.5),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  gradient: LinearGradient(colors: [
                    ColorsConsts.starterColor,
                    ColorsConsts.endColor,
                  ], stops: [
                    0.0,
                    0.7
                  ]),
                ),
                child: Material(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {},
                    borderRadius: BorderRadius.circular(30),
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        'CheckOut',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).textSelectionColor,
                            fontSize: 14),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Spacer(),
            Text(
              'Total',
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).textSelectionColor,
                  fontSize: 14),
            ),
            Text(
              'US \$ 550',
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.blue,
                  fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
