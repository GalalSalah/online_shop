import 'package:flutter/material.dart';
import 'package:online_shop/conts/theme_data.dart';
import 'package:online_shop/inner_screens/product_details.dart';
import 'package:online_shop/provider/cart_provider.dart';
import 'package:online_shop/provider/dark_theme.dart';
import 'package:online_shop/provider/fav_provider.dart';
import 'package:online_shop/provider/product.dart';
import 'package:online_shop/screen/auth/login.dart';
import 'package:online_shop/screen/bootom_bar.dart';
import 'package:online_shop/screen/cart.dart';
import 'package:online_shop/screen/feeds.dart';
import 'package:online_shop/screen/landing_screen.dart';
import 'package:online_shop/screen/wishlist.dart';
import 'package:provider/provider.dart';

import 'inner_screens/brand_navigation_rail_screen.dart';
import 'inner_screens/category_feeds.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeChangeProvider = DarkThemeProvider();

  void getCurrentTheme() async {
    themeChangeProvider.darkTheme =
        await themeChangeProvider.darkThemePreferences.getTheme();
  }

  @override
  void initState() {
    getCurrentTheme();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => themeChangeProvider),
        ChangeNotifierProvider(
          create: (_) => Products(),
        ),
        ChangeNotifierProvider(
          create: (_) => CartProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => FavProvider(),
        ),
      ],
      child: Consumer<DarkThemeProvider>(
        builder: (context, themeData, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: Styles.themeData(themeChangeProvider.darkTheme, context),
            home: LandingScreen(),
            routes: {
              BrandNavigationRailScreen.routeName: (ctx) =>
                  BrandNavigationRailScreen(),
              Cart.routeName: (ctx) => Cart(),
              Feeds.routeName: (ctx) => Feeds(),
              Wishlist.routeName: (ctx) => Wishlist(),
              ProductDetails.routeName: (ctx) => ProductDetails(),
              CategoryFeedsScreen.routeName: (ctx) => CategoryFeedsScreen(),
              LoginScreen.routeName:(ctx)=>LoginScreen(),
            },
          );
        },
      ),
    );
  }
}
