// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductCategoryModel _$ProductCategoryModelFromJson(
        Map<String, dynamic> json) =>
    ProductCategoryModel(
      json['groupId'] as int,
      (json['categoryIds'] as List<dynamic>).map((e) => e as int).toList(),
      (json['categoryCodes'] as List<dynamic>).map((e) => e as String).toList(),
      (json['categoryNames'] as List<dynamic>).map((e) => e as String).toList(),
      json['bigImage'] as String,
      json['smallImage'] as String,
    );

Map<String, dynamic> _$ProductCategoryModelToJson(
        ProductCategoryModel instance) =>
    <String, dynamic>{
      'groupId': instance.groupId,
      'categoryIds': instance.categoryIds,
      'categoryCodes': instance.categoryCodes,
      'categoryNames': instance.categoryNames,
      'bigImage': instance.bigImage,
      'smallImage': instance.smallImage,
    };
