import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product_model.g.dart';

@JsonSerializable()
class ProductModel extends Equatable {
  @JsonKey(name: 'skuItemNo') final String skuItemNo;
  @JsonKey(name: 'itemName') final String itemName;
  @JsonKey(name: 'variant') final String variant;
  @JsonKey(name: 'itemNo') final String itemNo;

  const ProductModel(this.skuItemNo, this.itemName, this.variant, this.itemNo);

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
  
  @override
  List<Object?> get props => [skuItemNo, itemName, variant, itemNo];
}
