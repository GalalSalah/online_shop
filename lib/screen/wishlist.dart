import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../conts/colors_const.dart';
import '../conts/my_icon.dart';
import '../provider/fav_provider.dart';
import '../widgets/wishlist_empty.dart';
import '../widgets/wishlist_full.dart';
import 'package:provider/provider.dart';

class Wishlist extends StatelessWidget {
  const Wishlist({Key key}) : super(key: key);
  static const routeName = '/wishlist';

  @override
  Widget build(BuildContext context) {
    final favProvider = Provider.of<FavProvider>(context);

    return favProvider.getFavItems.isEmpty
        ? Scaffold(body: WishlistEmpty())
        : Scaffold(
            appBar: AppBar(
              title: Text('Wishlist(${favProvider.getFavItems.length})'),
              actions: [
                IconButton(
                    icon: Icon(MyAppIcons.trash),
                    onPressed: () {
                      favProvider.showDialogTextFav(
                          'Remove all wishlist!',
                          'All your wishlist will be remove, are you sure do this! ',
                          favProvider.clearWish(),
                          context);
                    })
              ],
            ),
            body: ListView.builder(
              itemCount: favProvider.getFavItems.length,
              itemBuilder: (BuildContext context, int index) {
                return ChangeNotifierProvider.value(
                    value: favProvider.getFavItems.values.toList()[index],
                    child: WishlistFull(
                      productId: favProvider.getFavItems.keys.toList()[index],
                    ));
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
                  gradient: LinearGradient(
                    colors: [
                      ColorsConsts.starterColor,
                      ColorsConsts.endColor,
                    ],
                    stops: [0.0, 0.7],
                  ),
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
