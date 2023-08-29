import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product_orderSKU.g.dart';

@JsonSerializable()
class ProductOrderSKUModel extends Equatable {
  @JsonKey(name: 'productId')
  final int productId;
  @JsonKey(name: 'productCd')
  final String productCd;
  @JsonKey(name: 'productName')
  final String productName;
  @JsonKey(name: 'orderQty')
  final double orderQty;
  @JsonKey(name: 'created_date')
  final String created_date;

  const ProductOrderSKUModel(this.productId, this.productCd, this.productName,
      this.orderQty, this.created_date);

  factory ProductOrderSKUModel.fromJson(Map<String, dynamic> json) =>
      _$ProductOrderSKUModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductOrderSKUModelToJson(this);

  @override
  List<Object?> get props => [
        productId,
        productCd,
        productName,
        orderQty,
        created_date,
      ];
}
