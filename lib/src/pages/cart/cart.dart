import 'package:acecook/src/pages/cart/cubit/cart_cubit.dart';
import 'package:acecook/src/pages/home/model/product_cart_data.dart';
import 'package:acecook/src/themes/light_color.dart';
import 'package:acecook/src/utils/extensions.dart';
import 'package:acecook/src/widgets/button.dart';
import 'package:acecook/src/widgets/round_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CartCubit>(
      create: (context) => CartCubit()..initCart(),
      child: const CartBody(),
    );
  }
}

class CartBody extends StatefulWidget {
  const CartBody({super.key});

  @override
  State<CartBody> createState() => _CartBodyState();
}

class _CartBodyState extends State<CartBody> {
  List<ProductCartModel> productCarts = [];
  double sumAll = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: LightColor.mainAppColor,
        title: const Text('Giỏ hàng'),
      ),
      body: BlocConsumer<CartCubit, CartState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          if (state is CartInitialSuccess) {
            productCarts = state.productCarts;
            sumAll = productCarts.fold<double>(
                0, (sum, item) => sum + (item.sum ?? 0));
            print(productCarts);
          }
          if (state is ReloadSuccess) {
            productCarts = state.productCarts;
            sumAll = productCarts.fold<double>(
                0, (sum, item) => sum + (item.sum ?? 0));
            print(productCarts);
          }
          return Container(
            child: Column(
              children: [
                Flexible(
                  child: SingleChildScrollView(
                    child: Column(
                        children:
                            productCarts.map((e) => cartItems(e)).toList()),
                  ),
                ),
                _checkoutSection()
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _checkoutSection() {
    return Material(
      color: Colors.black12,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
              padding:
                  EdgeInsets.only(top: 15, left: 20, right: 20, bottom: 10),
              child: Row(
                children: <Widget>[
                  Text(
                    "Tổng cộng:",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Text(
                    sumAll.asCurrency,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.red),
                  )
                ],
              )),
          Padding(
            padding: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
            child: AppButton(
              backgroundColor: LightColor.mainAppColor,
              height: 55,
              width: MediaQuery.of(context).size.width,
              title: 'Thanh toán',
              radius: 10,
            ),
          ),
        ],
      ),
    );
  }

  Widget cartItems(ProductCartModel item) {
    return RoundedContainer(
      padding: const EdgeInsets.all(0),
      margin: const EdgeInsets.all(10),
      height: 130,
      child: Row(
        children: <Widget>[
          Container(
            width: 130,
            decoration: BoxDecoration(
                image: DecorationImage(
              image: NetworkImage(item.smallImage ?? ''),
              // image: AssetImage(
              //     'assets/${item.smallImage?.replaceAll('..', '.') ?? ''}'),
              fit: BoxFit.cover,
            )),
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Flexible(
                        child: Text(
                          item.productName ?? '',
                          overflow: TextOverflow.fade,
                          softWrap: true,
                          style: const TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 15),
                        ),
                      ),
                      SizedBox(
                        width: 30,
                        child: IconButton(
                          onPressed: () {
                            context.read<CartCubit>().clickRemoveQuality(item);
                          },
                          color: Colors.red,
                          icon: const Icon(Icons.delete),
                          iconSize: 20,
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text("Price: "),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        (item.basePrice ?? 0).asCurrency.toString(),
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w300),
                      )
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      const Text(
                        "Ships Free",
                        style: TextStyle(color: Colors.orange),
                      ),
                      const Spacer(),
                      Row(
                        children: <Widget>[
                          InkWell(
                            onTap: () {
                              context.read<CartCubit>().clickMinusQuality(item);
                            },
                            splashColor: Colors.redAccent.shade200,
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50)),
                              alignment: Alignment.center,
                              child: const Padding(
                                padding: EdgeInsets.all(6.0),
                                child: Icon(
                                  Icons.remove,
                                  color: Colors.redAccent,
                                  size: 20,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Card(
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text('${item.quantity}'),
                            ),
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          InkWell(
                            onTap: () {
                              context.read<CartCubit>().clickAddQuality(item);
                            },
                            splashColor: Colors.lightBlue,
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50)),
                              alignment: Alignment.center,
                              child: const Padding(
                                padding: EdgeInsets.all(6.0),
                                child: Icon(
                                  Icons.add,
                                  color: Colors.green,
                                  size: 20,
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
