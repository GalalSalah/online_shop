import 'package:flutter/material.dart';
import 'package:online_shop/conts/colors_const.dart';
import 'package:online_shop/provider/dark_theme.dart';
import 'package:provider/provider.dart';

class CartEmpty extends StatelessWidget {
  const CartEmpty({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top:80),
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.4,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage('assets/images/emptycart.png'),
            ),
          ),
        ),
        Text(
          "Yor Cart Is Empty",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 36,
              color: Theme.of(context).textSelectionColor),
        ),
        SizedBox(
          height: 50,
        ),
        Text(
          "Looks like you did\'t \n add anything thing to your cart yet",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 26,
              color: themeChange.darkTheme
                  ? Theme.of(context).disabledColor
                  : ColorsConsts.subTitle),
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
            onPressed: () {},
            child: Text(
              "shop now".toUpperCase(),
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
