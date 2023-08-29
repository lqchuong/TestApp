import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class ProductCartModel extends Equatable {
  static List<ProductCartModel> productCarts = [];

  int? productId;
  String? productCd;
  String? productName;
  String? smallImage;
  int? productCategoryId;
  String? productCategoryCd;
  String? productCategoryName;
  int? brandId;
  String? brandCd;
  String? brandName;
  double? basePrice;
  int? quantity;
  double? sum;

  ProductCartModel(
    this.productId,
    this.productCd,
    this.productName,
    this.smallImage,
    this.productCategoryId,
    this.productCategoryCd,
    this.productCategoryName,
    this.brandId,
    this.brandName,
    this.brandCd,
    this.basePrice,
    this.quantity,
    this.sum,
  );

  ProductCartModel copyWith({
    int? productId,
    String? productCd,
    String? productName,
    String? smallImage,
    int? productCategoryId,
    String? productCategoryCd,
    String? productCategoryName,
    int? brandId,
    String? brandCd,
    String? brandName,
    double? basePrice,
    int? quantity,
    double? sum,
  }) {
    return ProductCartModel(
      productId = this.productId,
      productCd = this.productCd,
      productName = this.productName,
      smallImage = this.smallImage,
      productCategoryId = this.productCategoryId,
      productCategoryCd = this.productCategoryCd,
      productCategoryName = this.productCategoryName,
      brandId = this.brandId,
      brandName = this.brandName,
      brandCd = this.brandCd,
      basePrice = this.basePrice,
      quantity = quantity ?? this.quantity,
      sum = sum ?? this.sum,
    );
  }

  @override
  List<Object?> get props => [
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
        sum
      ];
}
