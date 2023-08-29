import 'package:acecook/src/model/data.dart';
import 'package:acecook/src/model/product.dart';
import 'package:acecook/src/pages/home/model/product_cart_data.dart';
import 'package:acecook/src/themes/light_color.dart';
import 'package:acecook/src/utils/extensions.dart';
import 'package:acecook/src/widgets/round_container.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ListProduct extends StatelessWidget {
  const ListProduct({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: LightColor.mainAppColor,
          title: const Text('Giỏ hàng'),
        ),
        body: Column(
          children: <Widget>[
            Flexible(
                child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: AppData.productList.isNotEmpty
                      ? AppData.productList.map((item) {
                          return cartItems(item);
                        }).toList()
                      : [
                          const Padding(
                            padding: EdgeInsets.only(top: 10.0),
                            child: Center(
                              child: Text('Hiện tại chưa có thông tin.'),
                            ),
                          )
                        ]),
            )),
            _checkoutSection()
          ],
        ));
  }

  Widget cartItems(Product item) {
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
              image: AssetImage(item.image!),
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
                          item.name ?? '',
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
                            print("Button Pressed");
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
                        item.price ?? '',
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
                            onTap: () {},
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
                          const Card(
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text('2'),
                            ),
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          InkWell(
                            onTap: () {},
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

  Widget _checkoutSection() {
    return Material(
      color: Colors.black12,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Padding(
              padding: EdgeInsets.only(top: 10, left: 10, right: 10),
              child: Row(
                children: <Widget>[
                  Text(
                    "Tổng cộng:",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                  ),
                  Spacer(),
                  Text(
                    "50.000.000 đ",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  )
                ],
              )),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Material(
              color: Colors.red,
              elevation: 1.0,
              child: InkWell(
                splashColor: Colors.redAccent,
                onTap: () {},
                child: const SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      "Checkout",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
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
                          print("Button Pressed");
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
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
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
                          onTap: () {},
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
                        const Card(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('2'),
                          ),
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        InkWell(
                          onTap: () {},
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
