import 'package:acecook/src/pages/home/model/product_cart_data.dart';
import 'package:acecook/src/widgets/product_card.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  void initCart() {
    final productCarts = ProductCartModel.productCarts;
    print(productCarts);
    emit(CartInitialSuccess(productCarts));
  }

  void clickAddQuality(ProductCartModel product) {
    emit(Loading());
    final productCarts = ProductCartModel.productCarts;
    final index = productCarts.indexOf(product);
    final value = (product.quantity ?? 0) + 1;
    double sum = value * (product.basePrice ?? 0);
    print(productCarts[index]);
    final newdata = productCarts[index].copyWith(quantity: value, sum: sum);
    productCarts[index] = newdata;
    print(productCarts);
    // // ProductCartModel.productCarts = productCarts;
    emit(ReloadSuccess(productCarts));
  }

  void clickMinusQuality(ProductCartModel product) {
    emit(Loading());
    final productCarts = ProductCartModel.productCarts;
    final index = productCarts.indexOf(product);
    int value = product.quantity ?? 0;
    if (value > 1) {
      value = value - 1;
      double sum = value * (product.basePrice ?? 0);
      final newdata = productCarts[index].copyWith(quantity: value, sum: sum);
      productCarts[index] = newdata;
      // ProductCartModel.productCarts = productCarts;
      emit(ReloadSuccess(productCarts));
    }
  }

  void clickRemoveQuality(ProductCartModel product) {
    emit(Loading());
    final productCarts = ProductCartModel.productCarts;
    final index = productCarts.indexOf(product);
    productCarts.removeAt(index);
    ProductCartModel.productCarts = productCarts;
    emit(ReloadSuccess(productCarts));
  }
}
