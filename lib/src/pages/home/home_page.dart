import 'package:acecook/src/contants/contants.dart';
import 'package:acecook/src/model/product_category.dart';
import 'package:acecook/src/model/product_info.dart';
import 'package:acecook/src/model/product_model.dart';
import 'package:acecook/src/model/product_orderSKU.dart';
import 'package:acecook/src/model/product_price.dart';
import 'package:acecook/src/pages/home/cubit/home_cubit.dart';
import 'package:acecook/src/pages/home/widget/add_item.dart';
import 'package:acecook/src/widgets/button.dart';
import 'package:acecook/src/widgets/product_category.dart';
import 'package:acecook/src/widgets/title_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:acecook/src/model/data.dart';
import 'package:acecook/src/pages/slide_bar/sidebar_menu.dart';
import 'package:acecook/src/themes/light_color.dart';
import 'package:acecook/src/themes/theme.dart';
import 'package:acecook/src/utils/extensions.dart';
import 'package:acecook/src/widgets/product_card.dart';
import 'package:acecook/src/widgets/product_icon.dart';
import 'package:acecook/src/widgets/text_field.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeCubit>(
      create: (context) => HomeCubit()..initHome(),
      child: const MyHomeBody(),
    );
  }
}

class MyHomeBody extends StatefulWidget {
  const MyHomeBody({
    Key? key,
  }) : super(key: key);

  @override
  _MyHomeBodyState createState() => _MyHomeBodyState();
}

class _MyHomeBodyState extends State<MyHomeBody> {
  final TextEditingController _searchCtrl = TextEditingController();
  List<ProductCategoryModel> productCategories = [];
  List<ProductInfoModel> products = [];
  List<ProductPriceModel> product = [];
  ProductInfoModel? productInfo;
  int quantity = 0;

  Widget _productWidget() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: AppTheme.fullWidth(context),
      height: (AppTheme.fullWidth(context) * .8) * products.length / 2,
      child: GridView(
        physics: const ClampingScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 4 / 5,
            mainAxisSpacing: 10,
            crossAxisSpacing: 20),
        padding: const EdgeInsets.only(left: 15, bottom: 10, right: 15),
        scrollDirection: Axis.vertical,
        children: products.map((product) {
          productInfo = product;

          return ProductCard(
            product: product,
            onTap: () {
              context.read<HomeCubit>().getPriceProduct(
                  product.productCd,
                  '${Network.urlImage}${product.smallImage!.replaceAll(' ', '%20')}',
                  product);
            },
          );
        }).toList(),
      ),
    );
  }

  Widget _productCategoryWidget(List<ProductCategoryModel> products) {
    return Container(
      // margin: EdgeInsets.symmetric(vertical: 20),
      width: MediaQuery.of(context).size.width,
      height: 240,
      child: GridView(
        physics: ClampingScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            childAspectRatio: 3 / 4,
            mainAxisSpacing: 5,
            crossAxisSpacing: 10),
        padding: const EdgeInsets.only(left: 10, bottom: 10, right: 10),
        scrollDirection: Axis.vertical,
        children: products
            .map(
              (product) => ProductCategory(
                product: product,
                onSelected: (model) {},
              ),
            )
            .toList(),
      ),
    );
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    Widget _appBar() {
      return Container(
          height: 120,
          padding: EdgeInsets.only(top: 50, left: 12, right: 12),
          decoration: BoxDecoration(
              //     image: DecorationImage(
              //   image: AssetImage('assets/.png'),
              //   fit: BoxFit.cover,
              // )
              color: LightColor.mainAppColor),
          alignment: Alignment.center,
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () {
                  _scaffoldKey.currentState!.openDrawer();
                },
                child: Icon(Icons.menu, color: LightColor.background),
              ),
              Expanded(
                child: SizedBox(
                  height: 60,
                  child: Image.asset(
                    'assets/acecook.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  context.push('/cart');
                },
                child: Icon(
                  Icons.shopping_cart,
                  color: LightColor.background,
                ),
              ),
            ],
          ));
    }

    void _addItem(BuildContext context, ProductPriceModel product, String image,
        ProductInfoModel productInfo) {
      showModalBottomSheet(
          // isScrollControlled: true, //full screen
          isDismissible: true,
          anchorPoint: Offset(30, 100),
          context: context,
          builder: (context) {
            return AddItemScreen(
                product: product, image: image, productInfo: productInfo);
          });
    }

    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        if (state is InitHomeSuccess) {
          productCategories = state.productCategories;
          products = state.products;
        }
        if (state is GetPriceOfProductSuccessful) {
          product = state.product;
          if (product.length != 0) {
            WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
              _addItem(context, product.first, state.image, state.productInfo);
              context.read<HomeCubit>().reloadHome();
            });
          } else {
            context.read<HomeCubit>().reloadHome();
          }
        }
        if (state is GetPriceOfProductFailed) {
          context.read<HomeCubit>().reloadHome();
        }

        return Scaffold(
          key: _scaffoldKey,
          extendBodyBehindAppBar: true,
          drawer: const SlideBarMenuView(),
          body: SingleChildScrollView(
            physics: ClampingScrollPhysics(),
            child: Container(
              // height: MediaQuery.of(context).size.height - 210,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  _appBar(),

                  // _search(),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 20.0, right: 10, left: 10),
                    child: Container(
                      // margin: EdgeInsets.only(top: 50),
                      // padding: const EdgeInsets.all(10),
                      child: AppTextField(
                        placeHolder: 'Tìm kiếm ...',
                        suffixIcon: const Icon(Icons.search),
                        radius: 10.0,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // _productCategoryWidget(productCategories),
                  const SizedBox(
                    height: 20,
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.only(left: 16.0),
                  //   child: Row(
                  //     children: [
                  //       Image.asset(
                  //         'assets/ic_badge.png',
                  //         height: 24,
                  //         width: 24,
                  //       ),
                  //       const SizedBox(
                  //         width: 5,
                  //       ),
                  //       const TitleText(
                  //         fontSize: 16,
                  //         text: 'Sản phẩm',
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  // _productWidget(),
                  // const SizedBox(
                  //   height: 10,
                  // ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
