import 'package:flutter/material.dart';
import 'package:online_shop/conts/colors_const.dart';

class WishlistFull extends StatefulWidget {
  const WishlistFull({Key key}) : super(key: key);

  @override
  _WishlistFullState createState() => _WishlistFullState();
}

class _WishlistFullState extends State<WishlistFull> {
  @override
  Widget build(BuildContext context) {
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
                      child: Image.network(
                          'https://abong.com.bd/public//admin/media/2020/03/yellow_mesh_men_sport_sneaker_shoesjpeg_20200307141459.jpeg'),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Title',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          '\$ 12',
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
        positionedRemove(),
      ],
    );
  }

  Widget positionedRemove() {
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
          onPressed: () {},
        ),
      ),
    );
  }
}
