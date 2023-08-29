import 'package:acecook/src/model/credential_model.dart';
import 'package:acecook/src/model/product_category.dart';
import 'package:acecook/src/model/product_info.dart';
import 'package:acecook/src/model/product_orderSKU.dart';
import 'package:acecook/src/model/product_price.dart';
import 'package:acecook/src/model/requests/product_info_request.dart';
import 'package:acecook/src/network/auth_service.dart';
import 'package:acecook/src/network/network_service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  Future<void> initHome() async {
    final productCategories = await getProductCategory();
    final productOrderSKUs = await getProductOrderSKU();
    final products = await getProducts();
    emit(InitHomeSuccess(
        productCategories: productCategories,
        productOrderSKUs: [],
        products: products));
  }

  Future<List<ProductCategoryModel>> getProductCategory() async {
    final authService = NetworkService.client.getService<AuthService>();
    // prefs = await SharedPreferences.getInstance();
    try {
      final response = await authService
          .getProductCategory('${AuthenResponseModel.clientInfo.clientId}');
      if (response.isSuccessful) {
        // final ProductCategoryModel productCategoryModel =
        //     ProductCategoryModel.fromJson(response.body['dataObject']);
        final List<ProductCategoryModel> productCategories = [];
        for (var item in response.body['dataObject']) {
          productCategories.add(ProductCategoryModel.fromJson(item));
        }

        return productCategories;
      } else {
        emit(InitHomeFail());
        return [];
        // emit(LoginFailed(error: response.error.toString()));
      }
    } catch (e, trace) {
      print('ERROR : ${e.toString()}');
      print('TRACE : ${trace.toString()}');
      // emit(LoginFailed());
      emit(InitHomeFail());
      return [];
    }
  }

  Future<List<ProductOrderSKUModel>> getProductOrderSKU() async {
    final authService = NetworkService.client.getService<AuthService>();
    // prefs = await SharedPreferences.getInstance();
    try {
      final response = await authService.getorderedSKU(
          'acv', '${AuthenResponseModel.clientInfo.clientId}');
      if (response.isSuccessful) {
        // final ProductCategoryModel productCategoryModel =
        //     ProductCategoryModel.fromJson(response.body['dataObject']);
        final List<ProductOrderSKUModel> productOrderSKUs = [];
        for (var item in response.body) {
          productOrderSKUs.add(ProductOrderSKUModel.fromJson(item));
        }

        return productOrderSKUs;
      } else {
        emit(InitHomeFail());
        return [];
        // emit(LoginFailed(error: response.error.toString()));
      }
    } catch (e, trace) {
      print('ERROR : ${e.toString()}');
      print('TRACE : ${trace.toString()}');
      // emit(LoginFailed());
      emit(InitHomeFail());
      return [];
    }
  }

  void reloadHome() {
    emit(ReloadHome());
  }

  Future<List<ProductInfoModel>> getProducts() async {
    final authService = NetworkService.client.getService<AuthService>();
    // prefs = await SharedPreferences.getInstance();
    try {
      ProductInfoRequest request = ProductInfoRequest('');
      final response = await authService.getProducts(
          0, 1, 100000, '${AuthenResponseModel.clientInfo.clientId}', request);
      if (response.isSuccessful) {
        List<ProductInfoModel> products = [];
        for (var item in response.body['dataObject']['content']) {
          products.add(ProductInfoModel.fromJson(item));
        }
        return products
            .where((element) => element.smallImage!.isNotEmpty)
            .take(12)
            .toList();
      } else {
        emit(InitHomeFail());
        return [];
        // emit(LoginFailed(error: response.error.toString()));
      }
    } catch (e, trace) {
      print('ERROR : ${e.toString()}');
      print('TRACE : ${trace.toString()}');
      // emit(LoginFailed());
      emit(InitHomeFail());
      return [];
    }
  }

  Future<void> getPriceProduct(productCd, image, productInfo) async {
    final authService = NetworkService.client.getService<AuthService>();
    // prefs = await SharedPreferences.getInstance();
    try {
      final response = await authService.getPridceOfProduct(
          'acv', AuthenResponseModel.clientInfo.clientId, productCd);

      if (response.isSuccessful) {
        List<ProductPriceModel> products = [];
        for (var item in response.body) {
          products.add(ProductPriceModel.fromJson(item));
        }
        emit(GetPriceOfProductSuccessful(products, image, productInfo));
      } else {
        emit(GetPriceOfProductFailed());
        // emit(LoginFailed(error: response.error.toString()));
      }
    } catch (e, trace) {
      print('ERROR : ${e.toString()}');
      print('TRACE : ${trace.toString()}');
      // emit(LoginFailed());
      emit(GetPriceOfProductFailed());
    }
  }
}
