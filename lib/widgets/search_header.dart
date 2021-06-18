import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:online_shop/conts/colors_const.dart';
import 'package:online_shop/provider/cart_provider.dart';
import 'package:online_shop/provider/fav_provider.dart';
import 'package:online_shop/screen/cart.dart';
import 'package:online_shop/screen/user_info.dart';
import 'package:online_shop/screen/wishlist.dart';
import 'package:provider/provider.dart';

class SearchByHeader extends SliverPersistentHeaderDelegate {
  final double flexibleSpace;
  final double backGroundHeight;
  final double stackPaddingTop;
  final double titlePaddingTop;
  final Widget title;
  final Widget subTitle;
  final Widget leading;
  final Widget action;
  final Widget stackChild;

  SearchByHeader({
    this.flexibleSpace = 250,
    this.backGroundHeight = 200,
    @required this.stackPaddingTop,
    this.titlePaddingTop = 35,
    @required this.title,
    this.subTitle,
    this.leading,
    this.action,
    @required this.stackChild,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    double percent = shrinkOffset / (maxExtent - minExtent);
    double calculate = 1 - percent < 0 ? 0 : (1 - percent);
    return SizedBox(
      height: maxExtent,
      child: Stack(
        children: [
          Container(
            height: minExtent + (backGroundHeight - minExtent) * calculate,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  ColorsConsts.starterColor,
                  ColorsConsts.endColor,
                ],
                begin: const FractionalOffset(0.0, 1.0),
                end: const FractionalOffset(1.0, 0.0),
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp,
              ),
            ),
          ),
          Positioned(
            top: 30,
            right: 10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Consumer<FavProvider>(
                  builder: (_, fav, child) => Badge(
                    badgeColor: ColorsConsts.favBadgeColor,
                    position: BadgePosition.topEnd(top: 5, end: 7),
                    badgeContent: Text(
                      fav.getFavItems.length.toString(),
                      style: TextStyle(color: ColorsConsts.white),
                    ),
                    child: IconButton(
                        icon: Icon(
                          Icons.favorite,
                          color: ColorsConsts.favColor,
                        ),
                        onPressed: () => Navigator.of(context)
                            .pushNamed(Wishlist.routeName)),
                  ),
                ),
                Consumer<CartProvider>(
                  builder: (_, cart, child) => Badge(
                    badgeColor: ColorsConsts.favBadgeColor,
                    position: BadgePosition.topEnd(top: 5, end: 7),
                    badgeContent: Text(
                      cart.getCartItems.length.toString(),
                      style: TextStyle(color: ColorsConsts.white),
                    ),
                    child: IconButton(
                      icon: Icon(
                        Icons.shopping_cart,
                        color: ColorsConsts.cartColor,
                      ),
                      onPressed: () =>
                          Navigator.of(context).pushNamed(Cart.routeName),
                    ),
                  ),
                )
              ],
            ),
          ),
          Positioned(
            top: 32,
            left: 10,
            child: Material(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey.shade300,
              child: InkWell(
                borderRadius: BorderRadius.circular(10),
                splashColor: Colors.grey,
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (c) => UserInfo(),
                  ),
                ),
                child: Container(
                  height: 40,
                  width: 40,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: NetworkImage(
                        'https://cdn1.vectorstock.com/i/thumb-large/62/60/default-avatar-photo-placeholder-profile-image-vector-21666260.jpg',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: MediaQuery.of(context).size.width * 0.35,
            top: titlePaddingTop * calculate + 27,
            bottom: 0.0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 24),
              width: MediaQuery.of(context).size.width,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  leading ?? SizedBox(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Transform.scale(
                        scale: 1 + (calculate * 0.5),
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(
                            top: 14 * (1 - calculate),
                          ),
                          child: title,
                        ),
                      ),
                      if (calculate > 0.5) ...[
                        SizedBox(
                          height: 10,
                        ),
                        Opacity(
                          opacity: calculate,
                          child: subTitle ?? SizedBox(),
                        ),
                      ],
                    ],
                  ),
                  Expanded(child: SizedBox()),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 14 * (1 - calculate),
                    ),
                    child: action ?? SizedBox(),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
              top: minExtent + ((stackPaddingTop - minExtent) * calculate),
              child: Opacity(
                opacity: calculate,
                child: Container(
                  child: stackChild,
                  width: MediaQuery.of(context).size.width,
                ),
              ))
        ],
      ),
    );
  }

  @override
  double get maxExtent => flexibleSpace;

  @override
  // TODO: implement minExtent
  double get minExtent => kToolbarHeight + 25;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
