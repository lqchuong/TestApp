// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductInfoModel _$ProductInfoModelFromJson(Map<String, dynamic> json) =>
    ProductInfoModel(
      json['productId'] as int?,
      json['applyEndDate'] as String?,
      json['applyStartDate'] as String?,
      (json['caseHeigth'] as num?)?.toDouble(),
      (json['caseLength'] as num?)?.toDouble(),
      (json['caseWeigth'] as num?)?.toDouble(),
      (json['caseWidth'] as num?)?.toDouble(),
      json['companyCd'] as String?,
      json['createdBy'] as int?,
      json['createdDate'] as String?,
      json['bigImage'] as String?,
      json['smallImage'] as String?,
      json['mproductCategory'] == null
          ? null
          : MproductCategoryModel.fromJson(
              json['mproductCategory'] as Map<String, dynamic>),
      json['mbrand'] == null
          ? null
          : MbrandModel.fromJson(json['mbrand'] as Map<String, dynamic>),
      json['munit'] == null
          ? null
          : MbrandModel.fromJson(json['munit'] as Map<String, dynamic>),
      json['date1'] as String?,
      json['date2'] as String?,
      json['date3'] as String?,
      json['date4'] as String?,
      json['date5'] as String?,
      json['deleteFlg'] as String?,
      (json['equivalenceSize'] as num?)?.toDouble(),
      json['expirationDays'] as int?,
      json['expirationUnit'] as String?,
      (json['lstFlavour'] as List<dynamic>?)?.map((e) => e as String).toList(),
      json['modifiedBy'] as int?,
      json['modifiedDate'] as String?,
      json['number1'] as String?,
      json['number2'] as String?,
      json['number3'] as String?,
      json['number4'] as int?,
      json['number5'] as String?,
      json['packingQty'] as int?,
      json['packingUnitId'] as int?,
      json['packingUnitName'] as String?,
      json['paleteQty'] as int?,
      json['priceLevel'] as String?,
      json['productCategoryId'] as int?,
      json['productCd'] as String?,
      json['productName'] as String?,
      json['status'] as String?,
      json['text1'] as String?,
      json['text2'] as String?,
      json['text3'] as String?,
      json['text4'] as String?,
      json['text5'] as String?,
      (json['transEquivalenceSize'] as num?)?.toDouble(),
      (json['weightPerUnit'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ProductInfoModelToJson(ProductInfoModel instance) =>
    <String, dynamic>{
      'productId': instance.productId,
      'applyEndDate': instance.applyEndDate,
      'applyStartDate': instance.applyStartDate,
      'caseHeigth': instance.caseHeigth,
      'caseLength': instance.caseLength,
      'caseWeigth': instance.caseWeigth,
      'caseWidth': instance.caseWidth,
      'companyCd': instance.companyCd,
      'createdBy': instance.createdBy,
      'createdDate': instance.createdDate,
      'date1': instance.date1,
      'date2': instance.date2,
      'date3': instance.date3,
      'date4': instance.date4,
      'date5': instance.date5,
      'deleteFlg': instance.deleteFlg,
      'equivalenceSize': instance.equivalenceSize,
      'expirationDays': instance.expirationDays,
      'expirationUnit': instance.expirationUnit,
      'modifiedBy': instance.modifiedBy,
      'modifiedDate': instance.modifiedDate,
      'number1': instance.number1,
      'number2': instance.number2,
      'number3': instance.number3,
      'number4': instance.number4,
      'number5': instance.number5,
      'packingQty': instance.packingQty,
      'packingUnitId': instance.packingUnitId,
      'paleteQty': instance.paleteQty,
      'priceLevel': instance.priceLevel,
      'productCd': instance.productCd,
      'productName': instance.productName,
      'status': instance.status,
      'text1': instance.text1,
      'text2': instance.text2,
      'text3': instance.text3,
      'text4': instance.text4,
      'text5': instance.text5,
      'transEquivalenceSize': instance.transEquivalenceSize,
      'weightPerUnit': instance.weightPerUnit,
      'productCategoryId': instance.productCategoryId,
      'bigImage': instance.bigImage,
      'smallImage': instance.smallImage,
      'packingUnitName': instance.packingUnitName,
      'lstFlavour': instance.lstFlavour,
      'mproductCategory': instance.mproductCategory,
      'mbrand': instance.mbrand,
      'munit': instance.munit,
    };

MproductCategoryModel _$MproductCategoryModelFromJson(
        Map<String, dynamic> json) =>
    MproductCategoryModel(
      json['productCategoryId'] as int?,
      json['companyCd'] as String?,
      json['createdBy'] as int?,
      json['createdDate'] as String?,
      json['productCategoryCd'] as String?,
      json['productCategoryName'] as String?,
      json['productPurpose'] as String?,
      json['groupCategoryId'] as int?,
      json['bigImage'] as String?,
      json['smallImage'] as String?,
      json['deleteFlg'] as String?,
      json['modifiedBy'] as int?,
      json['modifiedDate'] as String?,
    );

Map<String, dynamic> _$MproductCategoryModelToJson(
        MproductCategoryModel instance) =>
    <String, dynamic>{
      'productCategoryId': instance.productCategoryId,
      'companyCd': instance.companyCd,
      'createdBy': instance.createdBy,
      'createdDate': instance.createdDate,
      'deleteFlg': instance.deleteFlg,
      'modifiedBy': instance.modifiedBy,
      'modifiedDate': instance.modifiedDate,
      'productCategoryCd': instance.productCategoryCd,
      'productCategoryName': instance.productCategoryName,
      'productPurpose': instance.productPurpose,
      'groupCategoryId': instance.groupCategoryId,
      'bigImage': instance.bigImage,
      'smallImage': instance.smallImage,
    };

MbrandModel _$MbrandModelFromJson(Map<String, dynamic> json) => MbrandModel(
      json['brandId'] as int?,
      json['brandCd'] as String?,
      json['brandName'] as String?,
      json['companyCd'] as String?,
      json['createdBy'] as int?,
      json['createdDate'] as String?,
      json['bigImage'] as String?,
      json['smallImage'] as String?,
      json['modifiedDate'] as String?,
      json['modifiedBy'] as int?,
    );

Map<String, dynamic> _$MbrandModelToJson(MbrandModel instance) =>
    <String, dynamic>{
      'brandId': instance.brandId,
      'brandCd': instance.brandCd,
      'brandName': instance.brandName,
      'companyCd': instance.companyCd,
      'createdBy': instance.createdBy,
      'createdDate': instance.createdDate,
      'modifiedBy': instance.modifiedBy,
      'modifiedDate': instance.modifiedDate,
      'bigImage': instance.bigImage,
      'smallImage': instance.smallImage,
    };

MUnitModel _$MUnitModelFromJson(Map<String, dynamic> json) => MUnitModel(
      json['unitId'] as int?,
      json['companyCd'] as String?,
      json['createdBy'] as int?,
      json['createdDate'] as String?,
      json['deleteFlg'] as String?,
      json['modifiedBy'] as int?,
      json['modifiedDate'] as String?,
      json['unitCd'] as String?,
      json['unitName'] as String?,
    );

Map<String, dynamic> _$MUnitModelToJson(MUnitModel instance) =>
    <String, dynamic>{
      'unitId': instance.unitId,
      'unitCd': instance.unitCd,
      'unitName': instance.unitName,
      'companyCd': instance.companyCd,
      'createdBy': instance.createdBy,
      'createdDate': instance.createdDate,
      'modifiedBy': instance.modifiedBy,
      'modifiedDate': instance.modifiedDate,
      'deleteFlg': instance.deleteFlg,
    };
