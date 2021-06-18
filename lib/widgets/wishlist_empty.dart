import 'package:flutter/material.dart';
import 'package:online_shop/provider/dark_theme.dart';
import 'package:online_shop/screen/feeds.dart';
import 'package:provider/provider.dart';

class WishlistEmpty extends StatelessWidget {
  const WishlistEmpty({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            margin: EdgeInsets.only(top: 80),
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.4,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('assets/images/empty-wishlist.png'),
              ),
            ),
          ),
        ),
        Text(
          "Your Wishlist Is Empty",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 36,
              color: Theme.of(context).textSelectionColor),
        ),
        SizedBox(
          height: 30,
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.height * 0.06,
          child: RaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
              side: BorderSide(color: Colors.red),
            ),
            color: Colors.redAccent,
            onPressed: () {
              Navigator.pushNamed(context, Feeds.routeName);
            },
            child: Text(
              'Add a wish'.toUpperCase(),
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 36,
                  color: Theme.of(context).textSelectionColor),
            ),
          ),
        )
      ],
    );
  }
}
