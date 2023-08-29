import 'package:acecook/src/contants/contants.dart';
import 'package:acecook/src/model/product_category.dart';
import 'package:flutter/material.dart';

import 'package:acecook/src/model/product.dart';
import 'package:acecook/src/themes/light_color.dart';
import 'package:acecook/src/widgets/title_text.dart';
import 'package:acecook/src/widgets/extentions.dart';

class ProductCategory extends StatelessWidget {
  final ProductCategoryModel product;
  final ValueChanged<Product> onSelected;
  ProductCategory({Key? key, required this.product, required this.onSelected})
      : super(key: key);

//   @override
//   _ProductCardState createState() => _ProductCardState();
// }

// class _ProductCardState extends State<ProductCard> {
//   Product product;
//   @override
//   void initState() {
//     product = widget.product;
//     super.initState();
//   }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            // color: LightColor.background,
            // border: Border.all(color: LightColor.primaryBackgroundTextField),
            // borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(
                    child: Stack(
                      alignment: Alignment.center,
                      children: <Widget>[
                        CircleAvatar(
                          radius: 40,
                          backgroundColor:
                              LightColor.mainAppColor.withAlpha(40),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          width: MediaQuery.of(context).size.width - 20,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child:
                                // Image.asset(
                                //   'assets/${product.smallImage.replaceAll('..', '.')}',
                                Image.network(
                              '${Network.urlImage}${product.smallImage}',
                              fit: BoxFit.contain,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 5),
                  TitleText(
                    text: product.categoryNames.first,
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                  ),
                ],
              ),
            ],
          ),
        ));
    // PhysicalModel(
    //   borderRadius: BorderRadius.circular(15),
    //   color: LightColor.backgroundColor,
    //   elevation: 5.0,
    //   shadowColor: LightColor.backgroundColor,
    //   child: Container(
    //     decoration: BoxDecoration(
    //       color: LightColor.background,
    //       border: Border.all(color: LightColor.primaryBackgroundTextField),
    //       borderRadius: BorderRadius.all(Radius.circular(15)),
    //     ),
    //     child: Container(
    //       padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    //       child: Stack(
    //         alignment: Alignment.center,
    //         children: <Widget>[
    //           Column(
    //             crossAxisAlignment: CrossAxisAlignment.center,
    //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //             children: <Widget>[
    //               Expanded(
    //                 child: Stack(
    //                   alignment: Alignment.center,
    //                   children: <Widget>[
    //                     CircleAvatar(
    //                       radius: 40,
    //                       backgroundColor:
    //                           LightColor.mainAppColor.withAlpha(40),
    //                     ),
    //                     Container(
    //                       decoration: BoxDecoration(
    //                         borderRadius: BorderRadius.all(Radius.circular(20)),
    //                       ),
    //                       width: MediaQuery.of(context).size.width - 20,
    //                       child: ClipRRect(
    //                         borderRadius: BorderRadius.circular(10),
    //                         child: Image.network(
    //                           '${Network.urlImage}${product.smallImage}',
    //                           fit: BoxFit.contain,
    //                         ),
    //                       ),
    //                     )
    //                   ],
    //                 ),
    //               ),
    //               SizedBox(height: 5),
    //               TitleText(
    //                 text: product.categoryNames.first,
    //                 fontSize: 10,
    //               ),
    //             ],
    //           ),
    //         ],
    //       ),
    //     ).ripple(() {
    //       Navigator.of(context).pushNamed('/detail');
    //     }, borderRadius: BorderRadius.all(Radius.circular(20))),
    //   ),
    // );
  }
}
