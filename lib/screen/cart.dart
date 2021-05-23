import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:online_shop/conts/colors_const.dart';
import 'package:online_shop/conts/my_icon.dart';
import 'package:online_shop/provider/cart_provider.dart';
import 'package:online_shop/widgets/cart_empty.dart';
import 'package:online_shop/widgets/cart_full.dart';
import 'package:provider/provider.dart';

class Cart extends StatelessWidget {
  const Cart({Key key}) : super(key: key);
  static const routeName = '/cart';

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return cartProvider.getCartItems.isEmpty
        ? Scaffold(body: CartEmpty())
        : Scaffold(
            appBar: AppBar(
              title: Text('Cart Items Count'),
              actions: [
                IconButton(icon: Icon(MyAppIcons.trash), onPressed: () {})
              ],
            ),
            bottomSheet: checkOutSection(context),
            body: Container(
              margin: EdgeInsets.only(bottom: 60),
              child: ListView.builder(
                  itemCount: cartProvider.getCartItems.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ChangeNotifierProvider.value(
                        value: cartProvider.getCartItems.values.toList()[index],
                        child: CartFull(
                          productId:
                              cartProvider.getCartItems.keys.toList()[index],
                        ));
                  }),
            ));
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
