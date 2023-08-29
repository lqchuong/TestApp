part of 'home_cubit.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class InitHomeSuccess extends HomeState {
  final List<ProductCategoryModel> productCategories;
  final List<ProductOrderSKUModel> productOrderSKUs;
  final List<ProductInfoModel> products;
  const InitHomeSuccess(
      {required this.productCategories,
      required this.productOrderSKUs,
      required this.products});
}

class InitHomeFail extends HomeState {}

class ReloadHome extends HomeState {}

class GetPriceOfProductSuccessful extends HomeState {
  final List<ProductPriceModel> product;
  final ProductInfoModel productInfo;
  final String image;
  const GetPriceOfProductSuccessful(this.product, this.image, this.productInfo);
}

class GetPriceOfProductFailed extends HomeState {}
