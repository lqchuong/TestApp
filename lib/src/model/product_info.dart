import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product_info.g.dart';

@JsonSerializable()
class ProductInfoModel extends Equatable {
  @JsonKey(name: 'productId')
  final int? productId;

  @JsonKey(name: 'applyEndDate')
  final String? applyEndDate;

  @JsonKey(name: 'applyStartDate')
  final String? applyStartDate;

  @JsonKey(name: 'caseHeigth')
  final double? caseHeigth;

  @JsonKey(name: 'caseLength')
  final double? caseLength;

  @JsonKey(name: 'caseWeigth')
  final double? caseWeigth;

  @JsonKey(name: 'caseWidth')
  final double? caseWidth;

  @JsonKey(name: 'companyCd')
  final String? companyCd;

  @JsonKey(name: 'createdBy')
  final int? createdBy;

  @JsonKey(name: 'createdDate')
  final String? createdDate;

  @JsonKey(name: 'date1')
  final String? date1;

  @JsonKey(name: 'date2')
  final String? date2;

  @JsonKey(name: 'date3')
  final String? date3;

  @JsonKey(name: 'date4')
  final String? date4;

  @JsonKey(name: 'date5')
  final String? date5;

  @JsonKey(name: 'deleteFlg')
  final String? deleteFlg;

  @JsonKey(name: 'equivalenceSize')
  final double? equivalenceSize;

  @JsonKey(name: 'expirationDays')
  final int? expirationDays;

  @JsonKey(name: 'expirationUnit')
  final String? expirationUnit;

  @JsonKey(name: 'modifiedBy')
  final int? modifiedBy;

  @JsonKey(name: 'modifiedDate')
  final String? modifiedDate;

  @JsonKey(name: 'number1')
  final String? number1;

  @JsonKey(name: 'number2')
  final String? number2;

  @JsonKey(name: 'number3')
  final String? number3;

  @JsonKey(name: 'number4')
  final int? number4;

  @JsonKey(name: 'number5')
  final String? number5;

  @JsonKey(name: 'packingQty')
  final int? packingQty;

  @JsonKey(name: 'packingUnitId')
  final int? packingUnitId;

  @JsonKey(name: 'paleteQty')
  final int? paleteQty;

  @JsonKey(name: 'priceLevel')
  final String? priceLevel;

  @JsonKey(name: 'productCd')
  final String? productCd;

  @JsonKey(name: 'productName')
  final String? productName;

  @JsonKey(name: 'status')
  final String? status;

  @JsonKey(name: 'text1')
  final String? text1;

  @JsonKey(name: 'text2')
  final String? text2;

  @JsonKey(name: 'text3')
  final String? text3;

  @JsonKey(name: 'text4')
  final String? text4;

  @JsonKey(name: 'text5')
  final String? text5;

  @JsonKey(name: 'transEquivalenceSize')
  final double? transEquivalenceSize;

  @JsonKey(name: 'weightPerUnit')
  final double? weightPerUnit;

  @JsonKey(name: 'productCategoryId')
  final int? productCategoryId;

  @JsonKey(name: 'bigImage')
  final String? bigImage;

  @JsonKey(name: 'smallImage')
  final String? smallImage;
  @JsonKey(name: 'packingUnitName')
  final String? packingUnitName;

  @JsonKey(name: 'lstFlavour')
  final List<String>? lstFlavour;

  @JsonKey(name: 'mproductCategory')
  final MproductCategoryModel? mproductCategory;

  @JsonKey(name: 'mbrand')
  final MbrandModel? mbrand;

  @JsonKey(name: 'munit')
  final MbrandModel? munit;

  const ProductInfoModel(
      this.productId,
      this.applyEndDate,
      this.applyStartDate,
      this.caseHeigth,
      this.caseLength,
      this.caseWeigth,
      this.caseWidth,
      this.companyCd,
      this.createdBy,
      this.createdDate,
      this.bigImage,
      this.smallImage,
      this.mproductCategory,
      this.mbrand,
      this.munit,
      this.date1,
      this.date2,
      this.date3,
      this.date4,
      this.date5,
      this.deleteFlg,
      this.equivalenceSize,
      this.expirationDays,
      this.expirationUnit,
      this.lstFlavour,
      this.modifiedBy,
      this.modifiedDate,
      this.number1,
      this.number2,
      this.number3,
      this.number4,
      this.number5,
      this.packingQty,
      this.packingUnitId,
      this.packingUnitName,
      this.paleteQty,
      this.priceLevel,
      this.productCategoryId,
      this.productCd,
      this.productName,
      this.status,
      this.text1,
      this.text2,
      this.text3,
      this.text4,
      this.text5,
      this.transEquivalenceSize,
      this.weightPerUnit);

  factory ProductInfoModel.fromJson(Map<String, dynamic> json) =>
      _$ProductInfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductInfoModelToJson(this);

  @override
  List<Object?> get props => [
        productId,
        applyEndDate,
        applyStartDate,
        caseHeigth,
        caseLength,
        caseWeigth,
        caseWidth,
        companyCd,
        createdBy,
        createdDate,
        bigImage,
        smallImage,
        mproductCategory,
        mbrand,
        munit,
        date1,
        date2,
        date3,
        date4,
        date5,
        deleteFlg,
        equivalenceSize,
        expirationDays,
        expirationUnit,
        lstFlavour,
        modifiedBy,
        modifiedDate,
        number1,
        number2,
        number3,
        number4,
        number5,
        packingQty,
        packingUnitId,
        packingUnitName,
        paleteQty,
        priceLevel,
        productCategoryId,
        productCd,
        productName,
        status,
        text1,
        text2,
        text3,
        text4,
        text5,
        transEquivalenceSize,
        weightPerUnit
      ];
}

@JsonSerializable()
class MproductCategoryModel extends Equatable {
  @JsonKey(name: 'productCategoryId')
  final int? productCategoryId;

  @JsonKey(name: 'companyCd')
  final String? companyCd;

  @JsonKey(name: 'createdBy')
  final int? createdBy;

  @JsonKey(name: 'createdDate')
  final String? createdDate;

  @JsonKey(name: 'deleteFlg')
  final String? deleteFlg;

  @JsonKey(name: 'modifiedBy')
  final int? modifiedBy;

  @JsonKey(name: 'modifiedDate')
  final String? modifiedDate;

  @JsonKey(name: 'productCategoryCd')
  final String? productCategoryCd;

  @JsonKey(name: 'productCategoryName')
  final String? productCategoryName;

  @JsonKey(name: 'productPurpose')
  final String? productPurpose;

  @JsonKey(name: 'groupCategoryId')
  final int? groupCategoryId;

  @JsonKey(name: 'bigImage')
  final String? bigImage;

  @JsonKey(name: 'smallImage')
  final String? smallImage;

  const MproductCategoryModel(
      this.productCategoryId,
      this.companyCd,
      this.createdBy,
      this.createdDate,
      this.productCategoryCd,
      this.productCategoryName,
      this.productPurpose,
      this.groupCategoryId,
      this.bigImage,
      this.smallImage,
      this.deleteFlg,
      this.modifiedBy,
      this.modifiedDate);

  factory MproductCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$MproductCategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$MproductCategoryModelToJson(this);

  @override
  List<Object?> get props => [
        productCategoryId,
        companyCd,
        createdBy,
        createdDate,
        productCategoryCd,
        productCategoryName,
        productPurpose,
        groupCategoryId,
        bigImage,
        smallImage,
        deleteFlg,
        modifiedBy,
        modifiedDate
      ];
}

@JsonSerializable()
class MbrandModel extends Equatable {
  @JsonKey(name: 'brandId')
  final int? brandId;

  @JsonKey(name: 'brandCd')
  final String? brandCd;

  @JsonKey(name: 'brandName')
  final String? brandName;

  @JsonKey(name: 'companyCd')
  final String? companyCd;

  @JsonKey(name: 'createdBy')
  final int? createdBy;

  @JsonKey(name: 'createdDate')
  final String? createdDate;

  @JsonKey(name: 'modifiedBy')
  final int? modifiedBy;

  @JsonKey(name: 'modifiedDate')
  final String? modifiedDate;

  @JsonKey(name: 'bigImage')
  final String? bigImage;

  @JsonKey(name: 'smallImage')
  final String? smallImage;

  const MbrandModel(
      this.brandId,
      this.brandCd,
      this.brandName,
      this.companyCd,
      this.createdBy,
      this.createdDate,
      this.bigImage,
      this.smallImage,
      this.modifiedDate,
      this.modifiedBy);

  factory MbrandModel.fromJson(Map<String, dynamic> json) =>
      _$MbrandModelFromJson(json);

  Map<String, dynamic> toJson() => _$MbrandModelToJson(this);

  @override
  List<Object?> get props => [
        brandId,
        brandCd,
        brandName,
        companyCd,
        createdBy,
        createdDate,
        bigImage,
        smallImage,
        modifiedBy,
        modifiedDate
      ];
}

@JsonSerializable()
class MUnitModel extends Equatable {
  @JsonKey(name: 'unitId')
  final int? unitId;

  @JsonKey(name: 'unitCd')
  final String? unitCd;

  @JsonKey(name: 'unitName')
  final String? unitName;

  @JsonKey(name: 'companyCd')
  final String? companyCd;

  @JsonKey(name: 'createdBy')
  final int? createdBy;

  @JsonKey(name: 'createdDate')
  final String? createdDate;

  @JsonKey(name: 'modifiedBy')
  final int? modifiedBy;

  @JsonKey(name: 'modifiedDate')
  final String? modifiedDate;

  @JsonKey(name: 'deleteFlg')
  final String? deleteFlg;

  const MUnitModel(
    this.unitId,
    this.companyCd,
    this.createdBy,
    this.createdDate,
    this.deleteFlg,
    this.modifiedBy,
    this.modifiedDate,
    this.unitCd,
    this.unitName,
  );

  factory MUnitModel.fromJson(Map<String, dynamic> json) =>
      _$MUnitModelFromJson(json);

  Map<String, dynamic> toJson() => _$MUnitModelToJson(this);

  @override
  List<Object?> get props => [
        unitId,
        companyCd,
        createdBy,
        createdDate,
        deleteFlg,
        modifiedBy,
        modifiedDate,
        unitCd,
        unitName
      ];
}
