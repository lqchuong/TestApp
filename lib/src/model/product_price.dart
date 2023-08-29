import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product_price.g.dart';

@JsonSerializable()
class ProductPriceModel extends Equatable {
  @JsonKey(name: 'priceDetailId')
  final String? priceDetailId;
  @JsonKey(name: 'companyCd')
  final String? companyCd;
  @JsonKey(name: 'priceId')
  final String? priceId;
  @JsonKey(name: 'productCd')
  final String? productCd;
  @JsonKey(name: 'basePrice')
  final double? basePrice;
  @JsonKey(name: 'applyStartDate')
  final String? applyStartDate;
  @JsonKey(name: 'applyEndDate')
  final String? applyEndDate;
  @JsonKey(name: 'deleteFlg')
  final String? deleteFlg;
  @JsonKey(name: 'createdBy')
  final String? createdBy;
  @JsonKey(name: 'createdDate')
  final String? createdDate;
  @JsonKey(name: 'modifiedBy')
  final String? modifiedBy;
  @JsonKey(name: 'modifiedDate')
  final String? modifiedDate;

  const ProductPriceModel(
      this.priceDetailId,
      this.companyCd,
      this.priceId,
      this.productCd,
      this.applyStartDate,
      this.basePrice,
      this.applyEndDate,
      this.deleteFlg,
      this.createdBy,
      this.createdDate,
      this.modifiedBy,
      this.modifiedDate);

  factory ProductPriceModel.fromJson(Map<String, dynamic> json) =>
      _$ProductPriceModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductPriceModelToJson(this);

  @override
  List<Object?> get props => [
        priceDetailId,
        companyCd,
        priceId,
        productCd,
        applyStartDate,
        basePrice,
        applyEndDate,
        deleteFlg,
        createdBy,
        createdDate,
        modifiedBy,
        modifiedDate
      ];
}
