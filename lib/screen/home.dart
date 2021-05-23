import 'package:backdrop/app_bar.dart';
import 'package:backdrop/button.dart';
import 'package:backdrop/scaffold.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:online_shop/conts/colors_const.dart';
import 'package:online_shop/inner_screens/brand_navigation_rail_screen.dart';
import 'package:online_shop/provider/product.dart';
import 'package:online_shop/screen/feeds.dart';
import 'package:online_shop/widgets/back_layer.dart';
import 'package:online_shop/widgets/category.dart';
import 'package:online_shop/widgets/popular_product.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Products>(context);
    final popularProduct = productData.popularProducts;
    List _carouselImages = [
      'assets/images/carousel1.png',
      'assets/images/carousel2.jpeg',
      'assets/images/carousel3.jpg',
      'assets/images/carousel4.png'
    ];

    List _swiperBrand = [
      'assets/images/addidas.jpg',
      'assets/images/apple.jpg',
      'assets/images/Dell.jpg',
      'assets/images/h&m.jpg',
      'assets/images/nike.jpg',
      'assets/images/samsung.jpg',
      'assets/images/Huawei.jpg',
    ];
    return BackdropScaffold(
      frontLayerBackgroundColor: Theme.of(context).scaffoldBackgroundColor,
      headerHeight: MediaQuery.of(context).size.height * 0.25,
      appBar: BackdropAppBar(
        leading: BackdropToggleButton(
          icon: AnimatedIcons.menu_home,
        ),
        title: Text("Backdrop Example"),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [ColorsConsts.starterColor, ColorsConsts.endColor])),
        ),
        actions: <Widget>[
          BackdropToggleButton(
            icon: AnimatedIcons.list_view,
          ),
          IconButton(
              icon: CircleAvatar(
                radius: 15,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: 13,
                  backgroundImage: NetworkImage(
                      'https://cdn1.vectorstock.com/i/thumb-large/62/60/default-avatar-photo-placeholder-profile-image-vector-21666260.jpg'),
                ),
              ),
              onPressed: () {})
        ],
      ),
      backLayer: BackLayer(),
      frontLayer: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                height: 190.0,
                width: double.infinity,
                child: Carousel(
                  boxFit: BoxFit.fill,
                  images: [
                    ExactAssetImage(_carouselImages[0]),
                    ExactAssetImage(_carouselImages[1]),
                    ExactAssetImage(_carouselImages[2]),
                    ExactAssetImage(_carouselImages[3]),
                  ],
                  dotSize: 4.0,
                  dotSpacing: 15.0,
                  dotColor: Colors.purple,
                  indicatorBgPadding: 5.0,
                  dotBgColor: Colors.black.withOpacity(0.5),
                  borderRadius: false,
                  // moveIndicatorFromBottom: 180.0,
                  noRadiusForIndicator: true,
                  autoplay: true,
                )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Categories',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
              ),
            ),
            Container(
              width: double.infinity,
              height: 180,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 7,
                  itemBuilder: (BuildContext context, int index) {
                    return CategoryWidget(
                      index: index,
                    );
                  }),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    'Popular Brands',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                  ),
                  Spacer(),
                  FlatButton(
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        BrandNavigationRailScreen.routeName,
                        arguments: {7},
                      );
                    },
                    child: Text(
                      'View all..',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w900,
                          color: Colors.red),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 190,
              width: MediaQuery.of(context).size.width * 0.95,
              child: Swiper(
                itemCount: _swiperBrand.length,
                autoplay: true,
                viewportFraction: 0.8,
                scale: 0.9,
                onTap: (index) {
                  Navigator.pushNamed(
                    context,
                    BrandNavigationRailScreen.routeName,
                    arguments: {index},
                  );
                },
                itemBuilder: (BuildContext context, int index) {
                  return ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        color: Colors.blueGrey,
                        child: Image.asset(
                          _swiperBrand[index],
                          fit: BoxFit.fill,
                        ),
                      ));
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    'Popular Products',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                  ),
                  Spacer(),
                  FlatButton(
                    onPressed: () {Navigator.pushNamed(context, Feeds.routeName,arguments: 'popular');},
                    child: Text(
                      'View all..',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w900,
                          color: Colors.red),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 285,
              margin: EdgeInsets.symmetric(horizontal: 3),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: popularProduct.length,
                itemBuilder: (BuildContext context, int i) {
                  return ChangeNotifierProvider.value(
                    value: popularProduct[i],
                    child: PopularProduct(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
