import 'package:acecook/src/pages/home/model/product_cart_data.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'add_item_state.dart';

class AddItemCubit extends Cubit<AddItemState> {
  AddItemCubit() : super(AddItemInitial());

  void clickAddQuality(quantity) {
    final value = quantity + 1;
    emit(AddQuantitySuccessful(value));
  }

  void clickMinusQuality(quantity) {
    if (quantity > 0) {
      final value = quantity - 1;
      emit(MinusQuantitySuccessful(value));
    }
  }

  void reloadPage() {
    emit(ReloadPage());
  }

  void submitProduct(ProductCartModel product) {
    List<ProductCartModel> productCarts = ProductCartModel.productCarts;

    if (productCarts.isNotEmpty) {
      final arr = productCarts.where((element) {
        return element.productId == product.productId;
      }).toList();

      if (arr.isNotEmpty) {
        final index = productCarts.indexOf(arr.first);

        final sum = (productCarts[index].sum ?? 0) + (product.sum ?? 0);
        final quantity =
            (productCarts[index].quantity ?? 0) + (product.quantity ?? 0);

        final newData =
            productCarts[index].copyWith(quantity: quantity, sum: sum);
        productCarts[index] = newData;
      } else {
        productCarts.add(product);
      }
    } else {
      productCarts.add(product);
    }
    emit(SubmitAndDismiss());
  }
}
