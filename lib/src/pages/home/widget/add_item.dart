import 'package:acecook/src/model/product_info.dart';
import 'package:acecook/src/model/product_price.dart';
import 'package:acecook/src/pages/home/cubit/home_cubit.dart';
import 'package:acecook/src/pages/home/model/product_cart_data.dart';
import 'package:acecook/src/pages/home/widget/cubit/add_item_cubit.dart';
import 'package:acecook/src/themes/light_color.dart';
import 'package:acecook/src/utils/extensions.dart';
import 'package:acecook/src/widgets/button.dart';
import 'package:acecook/src/widgets/text_field.dart';
import 'package:acecook/src/widgets/title_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddItemScreen extends StatelessWidget {
  final ProductPriceModel product;
  final String image;
  final ProductInfoModel productInfo;
  const AddItemScreen(
      {super.key,
      required this.product,
      required this.image,
      required this.productInfo});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AddItemCubit>(
      create: (context) => AddItemCubit(),
      child: AddItemBody(
        image: image,
        product: product,
        productInfo: productInfo,
      ),
    );
  }
}

class AddItemBody extends StatefulWidget {
  final ProductPriceModel product;
  final String image;
  final ProductInfoModel productInfo;
  const AddItemBody(
      {super.key,
      required this.product,
      required this.image,
      required this.productInfo});

  @override
  State<AddItemBody> createState() => _AddItemBodyState();
}

class _AddItemBodyState extends State<AddItemBody> {
  TextEditingController quantityController = new TextEditingController();
  int quantity = 0;
  double price = 0.0;
  @override
  Widget build(BuildContext context) {
    quantityController.text = quantity.toString();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(height: 15),
        Stack(
          alignment: Alignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 40,
              backgroundColor: LightColor.mainAppColor.withAlpha(40),
            ),
            Container(
              // height: MediaQuery.of(context).size.width * 0.3,
              // width: MediaQuery.of(context).size.width * 0.6,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              width: MediaQuery.of(context).size.width * 0.7,
              height: MediaQuery.of(context).size.width * 0.5,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  widget.image,
                  fit: BoxFit.fill,
                ),
              ),
            )
          ],
        ),
        BlocBuilder<AddItemCubit, AddItemState>(
          builder: (context, state) {
            if (state is AddQuantitySuccessful) {
              price = state.value * (widget.product.basePrice ?? 0.0);
              quantityController.text = state.value.toString();
              context.read<AddItemCubit>().reloadPage();
            }

            if (state is MinusQuantitySuccessful) {
              quantityController.text = state.value.toString();
              price = state.value * (widget.product.basePrice ?? 0.0);
              context.read<AddItemCubit>().reloadPage();
            }
            if (state is SubmitAndDismiss) {
              Navigator.pop(context);
            }
            return Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 15),
                  TitleText(
                    text: widget.product.basePrice!.asCurrency.toString(),
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(height: 5),
                  TitleText(
                    fontSize: 16,
                    text: widget.productInfo.productName ?? '',
                  ),
                  SizedBox(height: 5),
                  TitleText(
                    fontSize: 14,
                    color: Colors.black54,
                    text: widget.productInfo.mproductCategory
                            ?.productCategoryName ??
                        '',
                  ),
                  SizedBox(height: 15),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 25,
                        height: 25,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.grey[300]),
                        child: InkWell(
                          onTap: () {
                            context.read<AddItemCubit>().clickAddQuality(
                                int.parse(quantityController.text));
                          },
                          child: Icon(
                            Icons.add,
                            color: Colors.black,
                            size: 18,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Container(
                          width: 40,
                          child: AppTextField(
                            // textAlign: TextAlign.center,
                            controller: quantityController,
                          )),
                      SizedBox(
                        width: 15,
                      ),
                      Container(
                        width: 25,
                        height: 25,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.grey[300]),
                        child: InkWell(
                          onTap: () {
                            context.read<AddItemCubit>().clickMinusQuality(
                                int.parse(quantityController.text));
                          },
                          child: Icon(
                            Icons.horizontal_rule,
                            color: Colors.black,
                            size: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  AppButton(
                    backgroundColor: LightColor.mainAppColor,
                    height: 55,
                    width: MediaQuery.of(context).size.width,
                    title: 'Thêm vào giỏ hàng - ${price.asCurrency}',
                    onPress: () {
                      final productId = widget.productInfo.productId;
                      final productCd = widget.productInfo.productCd;
                      final productName = widget.productInfo.productName;
                      final smallImage = widget.image;
                      final productCategoryId = widget
                          .productInfo.mproductCategory?.productCategoryId;
                      final productCategoryCd = widget
                          .productInfo.mproductCategory?.productCategoryCd;
                      final productCategoryName = widget
                          .productInfo.mproductCategory?.productCategoryName;
                      final brandId = widget.productInfo.mbrand?.brandId;
                      final brandName = widget.productInfo.mbrand?.brandName;
                      final brandCd = widget.productInfo.mbrand?.brandCd;
                      final quantity = int.parse(quantityController.text);
                      final basePrice = widget.product.basePrice;
                      final sum = price;
                      final ProductCartModel data = ProductCartModel(
                          productId,
                          productCd,
                          productName,
                          smallImage,
                          productCategoryId,
                          productCategoryCd,
                          productCategoryName,
                          brandId,
                          brandName,
                          brandCd,
                          basePrice,
                          quantity,
                          sum);

                      context.read<AddItemCubit>().submitProduct(data);
                    },
                  ),
                  SizedBox(height: 10),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
