// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) => ProductModel(
      json['skuItemNo'] as String,
      json['itemName'] as String,
      json['variant'] as String,
      json['itemNo'] as String,
    );

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      'skuItemNo': instance.skuItemNo,
      'itemName': instance.itemName,
      'variant': instance.variant,
      'itemNo': instance.itemNo,
    };
