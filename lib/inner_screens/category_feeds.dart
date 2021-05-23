import 'package:flutter/material.dart';
import 'package:online_shop/models/product.dart';
import 'package:online_shop/provider/product.dart';
import 'package:online_shop/widgets/feeds_products.dart';
import 'package:provider/provider.dart';

class CategoryFeedsScreen extends StatelessWidget {
  CategoryFeedsScreen({Key key}) : super(key: key);
  static const routeName = '/CategoryFeedsScreen';

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<Products>(context, listen: false);

    final categoryProvider =
        ModalRoute.of(context).settings.arguments as String;
    print(categoryProvider);
    final productList = productProvider.findByCategory(categoryProvider);
    return Scaffold(
      body: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 240 / 460,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        children: List.generate(
            productList.length,
            (index) => ChangeNotifierProvider.value(
                  value: productList[index],
                  child: FeedsProducts(
                      // id: productList[index].id,
                      // description: productList[index].description,
                      // price: productList[index].price,
                      // imageUrl: productList[index].imageUrl,
                      // isFavourite: productList[index].isFavourite,
                      // quantity: productList[index].quantity,
                      ),
                )),
      ),
      // StaggeredGridView.countBuilder(
      //   padding: EdgeInsets.all(5),
      //   crossAxisCount: 4,
      //
      //   itemCount: _products.length,
      //   itemBuilder: (BuildContext context, int index) => FeedsProducts(
      //     id: _products[index].id,
      //     description: _products[index].description,
      //     price: _products[index].price,
      //     imageUrl: _products[index].imageUrl,
      //     isFavourite: _products[index].isFavourite,
      //     quantity: _products[index].quantity,
      //   ),
      //   staggeredTileBuilder: (int index) =>
      //       new StaggeredTile.count(2, index.isEven ? 3 : 4),
      //   mainAxisSpacing: 4.0,
      //   crossAxisSpacing: 4.0,
      //
      // ),
    );

    //   GridView.count(
    //   crossAxisCount: 2,
    //   childAspectRatio: 240 / 290,
    //   crossAxisSpacing: 8,
    //   mainAxisSpacing: 8,
    //   children: List.generate(100, (index) => FeedsProducts()),
    // );
  }
}
