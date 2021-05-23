import 'package:flutter/material.dart';
import 'package:online_shop/conts/colors_const.dart';
import 'package:online_shop/conts/my_icon.dart';
import 'package:online_shop/screen/cart.dart';
import 'package:online_shop/screen/feeds.dart';

class BackLayer extends StatelessWidget {
  BackLayer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Ink(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                ColorsConsts.starterColor,
                ColorsConsts.endColor,
              ],
              begin: const FractionalOffset(0, 0),
              end: const FractionalOffset(1, 0),
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp,
            ),
          ),
        ),
        Positioned(
          top: -100,
          left: 140,
          child: Transform.rotate(
            angle: -0.5,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white.withOpacity(0.3),
              ),
              width: 150,
              height: 250,
            ),
          ),
        ),
        Positioned(
          bottom: 0.0,
          right: 100,
          child: Transform.rotate(
            angle: -0.8,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white.withOpacity(0.3),
              ),
              width: 150,
              height: 250,
            ),
          ),
        ),
        Positioned(
          top: -50.0,
          left: 60.0,
          child: Transform.rotate(
            angle: -0.5,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.white.withOpacity(0.3),
              ),
              width: 150,
              height: 200,
            ),
          ),
        ),
        Positioned(
          bottom: 10.0,
          right: 0.0,
          child: Transform.rotate(
            angle: -0.8,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.white.withOpacity(0.3),
              ),
              width: 150,
              height: 200,
            ),
          ),
        ),
        SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                  child:
                  Container(
                    padding: EdgeInsets.all(8),
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Theme.of(context).backgroundColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child:
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: NetworkImage(
                            'https://cdn1.vectorstock.com/i/thumb-large/62/60/default-avatar-photo-placeholder-profile-image-vector-21666260.jpg',
                          ),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                content(context, () {
                  navigateTo(context, Feeds.routeName);
                }, 'Feeds', 0),
                const SizedBox(
                  height: 10,
                ),
                content(context, () {
                  navigateTo(context, Cart.routeName);
                }, 'Cart', 1),
                const SizedBox(
                  height: 10,
                ),
                content(context, () {
                  navigateTo(context, Feeds.routeName);
                }, 'Wishlist', 2),
                const SizedBox(
                  height: 10,
                ),
                content(context, () {
                  navigateTo(context, Feeds.routeName);
                }, 'Upload a new product', 3),
              ],
            ),
          ),
        )
      ],
    );
  }

  List _contentIcons = [
    MyAppIcons.rss,
    MyAppIcons.bag,
    MyAppIcons.wishlist,
    MyAppIcons.upload,
  ];

  void navigateTo(BuildContext context, String routeName) {
    Navigator.pushNamed(context, routeName);
  }

  Widget content(BuildContext context, Function fct, String text, int index) {
    return InkWell(
      onTap: fct,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              text,
              style: TextStyle(
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Icon(_contentIcons[index]),
        ],
      ),
    );
  }
}
