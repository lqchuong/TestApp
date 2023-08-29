// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_orderSKU.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductOrderSKUModel _$ProductOrderSKUModelFromJson(
        Map<String, dynamic> json) =>
    ProductOrderSKUModel(
      json['productId'] as int,
      json['productCd'] as String,
      json['productName'] as String,
      (json['orderQty'] as num).toDouble(),
      json['created_date'] as String,
    );

Map<String, dynamic> _$ProductOrderSKUModelToJson(
        ProductOrderSKUModel instance) =>
    <String, dynamic>{
      'productId': instance.productId,
      'productCd': instance.productCd,
      'productName': instance.productName,
      'orderQty': instance.orderQty,
      'created_date': instance.created_date,
    };
