// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_price.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductPriceModel _$ProductPriceModelFromJson(Map<String, dynamic> json) =>
    ProductPriceModel(
      json['priceDetailId'] as String?,
      json['companyCd'] as String?,
      json['priceId'] as String?,
      json['productCd'] as String?,
      json['applyStartDate'] as String?,
      (json['basePrice'] as num?)?.toDouble(),
      json['applyEndDate'] as String?,
      json['deleteFlg'] as String?,
      json['createdBy'] as String?,
      json['createdDate'] as String?,
      json['modifiedBy'] as String?,
      json['modifiedDate'] as String?,
    );

Map<String, dynamic> _$ProductPriceModelToJson(ProductPriceModel instance) =>
    <String, dynamic>{
      'priceDetailId': instance.priceDetailId,
      'companyCd': instance.companyCd,
      'priceId': instance.priceId,
      'productCd': instance.productCd,
      'basePrice': instance.basePrice,
      'applyStartDate': instance.applyStartDate,
      'applyEndDate': instance.applyEndDate,
      'deleteFlg': instance.deleteFlg,
      'createdBy': instance.createdBy,
      'createdDate': instance.createdDate,
      'modifiedBy': instance.modifiedBy,
      'modifiedDate': instance.modifiedDate,
    };
