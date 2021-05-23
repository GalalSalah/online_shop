import 'package:flutter/material.dart';
import 'package:online_shop/inner_screens/category_feeds.dart';
import 'package:online_shop/screen/feeds.dart';

class CategoryWidget extends StatefulWidget {
  CategoryWidget({Key key, this.index}) : super(key: key);

  final int index;

  @override
  _CategoryWidgetState createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> categories = [
      {
        'categoryName': 'Phones',
        'categoryImagesPath': 'assets/images/CatPhones.png',
      },
      {
        'categoryName': 'Clothes',
        'categoryImagesPath': 'assets/images/CatClothes.jpg',
      },
      {
        'categoryName': 'Shoes',
        'categoryImagesPath': 'assets/images/CatShoes.jpg',
      },
      {
        'categoryName': 'Beauty&Health',
        'categoryImagesPath': 'assets/images/CatBeauty.jpg',
      },
      {
        'categoryName': 'Laptops',
        'categoryImagesPath': 'assets/images/CatLaptops.png',
      },
      {
        'categoryName': 'Furniture',
        'categoryImagesPath': 'assets/images/CatFurniture.jpg',
      },
      {
        'categoryName': 'Watches',
        'categoryImagesPath': 'assets/images/CatWatches.jpg',
      },
    ];

    return Stack(
      children: [
        InkWell(
          onTap: () {
            Navigator.of(context).pushNamed(CategoryFeedsScreen.routeName,
                arguments: '${categories[widget.index]['categoryName']}');
            print('${categories[widget.index]['categoryName']}');
          },
          child: Container(
            width: 150,
            height: 150,
            margin: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(
                  categories[widget.index]['categoryImagesPath'],

                ),
              ),
            ),
          ),
        ),
        Positioned(
            bottom: 0,
            left: 10,
            right: 10,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              color: Theme
                  .of(context)
                  .backgroundColor,
              child: Text(
                categories[widget.index]['categoryName'],
                style: TextStyle(
                    color: Theme
                        .of(context)
                        .textSelectionColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 18),
              ),
            ))
      ],
    );
  }
}
