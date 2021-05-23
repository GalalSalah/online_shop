import 'package:flutter/material.dart';
import 'package:online_shop/inner_screens/product_details.dart';
import 'package:online_shop/models/product.dart';
import 'package:provider/provider.dart';

class BrandsNavigationRail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productAttribute = Provider.of<Product>(context);
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, ProductDetails.routeName,
            arguments: productAttribute.id);
      },
      child: Container(
        //  color: Colors.red,
        padding: EdgeInsets.only(left: 5.0, right: 5.0),
        margin: EdgeInsets.only(right: 20.0, bottom: 5, top: 18),
        constraints: BoxConstraints(
            minHeight: 150, minWidth: double.infinity, maxHeight: 180),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Container(
                width: 120,
                decoration: BoxDecoration(
                  color: Theme.of(context).backgroundColor,
                  image: DecorationImage(
                    image: NetworkImage(
                      productAttribute.imageUrl,
                    ),
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey,
                        offset: Offset(2.0, 2.0),
                        blurRadius: 2.0)
                  ],
                ),
              ),
            ),
            FittedBox(
              child: Container(
                margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
                decoration: BoxDecoration(
                    color: Theme.of(context).backgroundColor,
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(10.0),
                        topRight: Radius.circular(10.0)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey,
                          offset: Offset(5.0, 5.0),
                          blurRadius: 10.0)
                    ]),
                width: 160,
                padding: EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      productAttribute.title,
                      maxLines: 4,
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Theme.of(context).textSelectionColor),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    FittedBox(
                      child: Text('US ${productAttribute.price} \$',
                          maxLines: 1,
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 30.0,
                          )),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text(productAttribute.productCategoryName,
                        style: TextStyle(color: Colors.grey, fontSize: 18.0)),
                    SizedBox(
                      height: 20.0,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
//
// class BrandsNavigationRail extends StatelessWidget {
//   const BrandsNavigationRail({Key key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {},
//       child: Container(
//         padding: EdgeInsets.only(left: 5, right: 5),
//         margin: EdgeInsets.only(right: 20, bottom: 5, top: 18),
//         constraints: BoxConstraints(
//           minHeight: 150,
//           maxHeight: 180,
//           maxWidth: double.infinity,
//         ),
//         child: Row(
//           children: [
//             Expanded(
//               flex: 1,
//               child: Container(
//                 decoration: BoxDecoration(
//                   image: DecorationImage(
//                     image: NetworkImage(
//                       'https://cdn1.vectorstock.com/i/thumb-large/62/60/default-avatar-photo-placeholder-profile-image-vector-21666260.jpg',
//                     ),
//                     fit: BoxFit.contain,
//                   ),
//                   color: Theme.of(context).backgroundColor,
//                   borderRadius: BorderRadius.all(Radius.circular(10)),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.grey,
//                       offset: Offset(2.0, 2.0),
//                       blurRadius: 2,
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             FittedBox(
//               child: Container(
//                 margin: EdgeInsets.only(
//                   top: 20,
//                   bottom: 20,
//                 ),
//                 decoration: BoxDecoration(
//                   color: Theme.of(context).backgroundColor,
//                   borderRadius: BorderRadius.only(
//                     bottomLeft: Radius.circular(10),
//                     bottomRight: Radius.circular(10),
//                   ),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.grey,
//                       offset: Offset(5.0, 5.0),
//                       blurRadius: 10,
//                     ),
//                   ],
//                 ),
//                 width: 160,
//                 padding: EdgeInsets.all(20),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'Title',
//                       maxLines: 4,
//                       style: TextStyle(
//                           color: Theme.of(context).textSelectionColor,
//                           fontWeight: FontWeight.w700),
//                     ),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     FittedBox(
//                       child: Text(
//                         'US 12 \$',
//                         maxLines: 1,
//                         style: TextStyle(color: Colors.red, fontSize: 30),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     Text(
//                       'Category name',
//                       style: TextStyle(color: Colors.grey, fontSize: 18),
//                     ),
//                     SizedBox(
//                       height: 20,
//                     ),
//                   ],
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
