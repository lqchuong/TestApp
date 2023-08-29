part of 'cart_cubit.dart';

abstract class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

class CartInitial extends CartState {}

class CartInitialSuccess extends CartState {
  final List<ProductCartModel> productCarts;
  const CartInitialSuccess(this.productCarts);
}

class Loading extends CartState {}

class ReloadSuccess extends CartState {
  final List<ProductCartModel> productCarts;
  const ReloadSuccess(this.productCarts);
}

class AddQuantitySuccessful extends CartState {
  final int value;
  const AddQuantitySuccessful(this.value);
}

class MinusQuantitySuccessful extends CartState {
  final int value;
  const MinusQuantitySuccessful(this.value);
}
