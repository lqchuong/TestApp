import 'package:flutter/material.dart';

import 'package:acecook/src/model/product.dart';
import 'package:acecook/src/themes/light_color.dart';
import 'package:acecook/src/widgets/title_text.dart';
import 'package:acecook/src/widgets/extentions.dart';

class ProductOrderSKUsCard extends StatelessWidget {
  final Product product;
  final ValueChanged<Product> onSelected;
  ProductOrderSKUsCard(
      {Key? key, required this.product, required this.onSelected})
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
    return PhysicalModel(
      borderRadius: BorderRadius.circular(15),
      color: LightColor.backgroundColor,
      elevation: 5.0,
      shadowColor: LightColor.backgroundColor,
      child: Container(
        decoration: BoxDecoration(
          color: LightColor.background,
          border: Border.all(color: LightColor.primaryBackgroundTextField),
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        margin:
            EdgeInsets.symmetric(vertical: !product.isSelected == true ? 0 : 0),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  SizedBox(height: product.isSelected ? 0 : 0),
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
                            child: Image.asset(
                              product.image ?? '',
                              fit: BoxFit.cover,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 5),
                  TitleText(
                    text: product.name ?? '',
                    fontSize: product.isSelected ? 12 : 10,
                  ),
                  SizedBox(height: 5),
                  TitleText(
                    text: product.category ?? '',
                    fontSize: product.isSelected ? 12 : 10,
                    color: LightColor.mainAppColor,
                  ),
                  SizedBox(height: 5),
                  TitleText(
                    text: product.price.toString(),
                    fontSize: product.isSelected ? 16 : 14,
                  ),
                ],
              ),
              Positioned(
                left: 0,
                top: 0,
                child: IconButton(
                  icon: Icon(
                    product.isliked ? Icons.favorite : Icons.favorite_border,
                    color: product.isliked
                        ? LightColor.mainAppColor
                        : LightColor.iconColor,
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ).ripple(() {
          Navigator.of(context).pushNamed('/detail');
          onSelected(product);
        }, borderRadius: BorderRadius.all(Radius.circular(20))),
      ),
    );
  }
}
