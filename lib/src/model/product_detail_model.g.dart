// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductDetailModel _$ProductDetailModelFromJson(Map<String, dynamic> json) =>
    ProductDetailModel(
      json['skuItemNo'] as String,
      json['itemName'] as String,
      json['variant'] as String,
      json['itemNo'] as String,
      json['color'] as String,
      json['size'] as String,
      json['division'] as String,
      json['category'] as String,
      json['productGroup'] as String,
      json['season'] as String,
      json['barcode'] as String,
      (json['unitPrice'] as num).toDouble(),
      (json['quantityThisStock'] as num).toDouble(),
      (json['quantityAllStore'] as num).toDouble(),
      (json['quantityWH'] as num).toDouble(),
      (json['image'] as List<dynamic>).map((e) => e as String).toList(),
      (json['attributeItem'] as List<dynamic>)
          .map((e) => AttributeModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductDetailModelToJson(ProductDetailModel instance) =>
    <String, dynamic>{
      'skuItemNo': instance.skuItemNo,
      'itemNo': instance.itemNo,
      'variant': instance.variant,
      'itemName': instance.itemName,
      'color': instance.color,
      'size': instance.size,
      'division': instance.division,
      'category': instance.category,
      'productGroup': instance.productGroup,
      'season': instance.season,
      'barcode': instance.barcode,
      'unitPrice': instance.unitPrice,
      'quantityThisStock': instance.quantityThisStock,
      'quantityAllStore': instance.quantityAllStore,
      'quantityWH': instance.quantityWH,
      'image': instance.image,
      'attributeItem': instance.attributeItem.map((e) => e.toJson()).toList(),
    };

AttributeModel _$AttributeModelFromJson(Map<String, dynamic> json) =>
    AttributeModel(
      json['attribute'] as String,
      json['attributeValue'] as String,
    );

Map<String, dynamic> _$AttributeModelToJson(AttributeModel instance) =>
    <String, dynamic>{
      'attribute': instance.attribute,
      'attributeValue': instance.attributeValue,
    };
