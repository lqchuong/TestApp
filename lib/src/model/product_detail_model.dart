import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product_detail_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ProductDetailModel extends Equatable {
  @JsonKey(name: 'skuItemNo')
  final String skuItemNo;
  @JsonKey(name: 'itemNo')
  final String itemNo;
  @JsonKey(name: 'variant')
  final String variant;
  @JsonKey(name: 'itemName')
  final String itemName;
  @JsonKey(name: 'color')
  final String color;
  @JsonKey(name: 'size')
  final String size;
  @JsonKey(name: 'division')
  final String division;
  @JsonKey(name: 'category')
  final String category;
  @JsonKey(name: 'productGroup')
  final String productGroup;
  @JsonKey(name: 'season')
  final String season;
  @JsonKey(name: 'barcode')
  final String barcode;
  @JsonKey(name: 'unitPrice')
  final double unitPrice;
  @JsonKey(name: 'quantityThisStock')
  final double quantityThisStock;
  @JsonKey(name: 'quantityAllStore')
  final double quantityAllStore;
  @JsonKey(name: 'quantityWH')
  final double quantityWH;
  @JsonKey(name: 'image')
  final List<String> image;
  @JsonKey(name: 'attributeItem')
  final List<AttributeModel> attributeItem;

  const ProductDetailModel(
      this.skuItemNo,
      this.itemName,
      this.variant,
      this.itemNo,
      this.color,
      this.size,
      this.division,
      this.category,
      this.productGroup,
      this.season,
      this.barcode,
      this.unitPrice,
      this.quantityThisStock,
      this.quantityAllStore,
      this.quantityWH,
      this.image,
      this.attributeItem);

  factory ProductDetailModel.fromJson(Map<String, dynamic> json) =>
      _$ProductDetailModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductDetailModelToJson(this);

  @override
  List<Object?> get props => [
        skuItemNo,
        itemName,
        color,
        size,
        division,
        category,
        productGroup,
        season,
        barcode,
        unitPrice,
        quantityAllStore,
        quantityThisStock,
        quantityWH,
        image,
        attributeItem
      ];
}

@JsonSerializable()
class AttributeModel extends Equatable {
  @JsonKey(name: 'attribute')
  final String attribute;
  @JsonKey(name: 'attributeValue')
  final String attributeValue;

  const AttributeModel(this.attribute, this.attributeValue);

  factory AttributeModel.fromJson(Map<String, dynamic> json) =>
      _$AttributeModelFromJson(json);

  Map<String, dynamic> toJson() => _$AttributeModelToJson(this);

  @override
  List<Object?> get props => [attribute, attributeValue];
}
