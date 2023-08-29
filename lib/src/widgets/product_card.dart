import 'package:acecook/src/contants/contants.dart';
import 'package:acecook/src/model/product_info.dart';
import 'package:flutter/material.dart';

import 'package:acecook/src/model/product.dart';
import 'package:acecook/src/themes/light_color.dart';
import 'package:acecook/src/widgets/title_text.dart';
import 'package:acecook/src/widgets/extentions.dart';

class ProductCard extends StatelessWidget {
  final ProductInfoModel product;
  void Function() onTap;
  ProductCard({Key? key, required this.product, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      borderRadius: BorderRadius.circular(15),
      color: LightColor.backgroundColor,
      elevation: 5.0,
      shadowColor: LightColor.backgroundColor,
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: BoxDecoration(
            color: LightColor.background,
            border: Border.all(color: LightColor.primaryBackgroundTextField),
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
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
                                //   'assets/${product.smallImage}',
                                Image.network(
                              '${Network.urlImage}${product.smallImage!.replaceAll(' ', '%20')}',
                              fit: BoxFit.fill,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 5),
                  TitleText(
                    text: product.productName ?? '',
                    fontSize: 12,
                  ),
                  SizedBox(height: 5),
                  TitleText(
                    text: product.mproductCategory?.productCategoryName ?? '',
                    fontSize: 10,
                    color: LightColor.mainAppColor,
                  ),
                  SizedBox(height: 5),
                  // TitleText(
                  //   text: product.pr.price.toString(),
                  //   fontSize: product.isSelected ? 16 : 14,
                  // ),
                ],
              ),
              Positioned(
                left: 0,
                top: 0,
                child: IconButton(
                  icon: Icon(
                    Icons.favorite,
                    color: LightColor.iconColor,
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
