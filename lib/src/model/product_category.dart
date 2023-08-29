import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product_category.g.dart';

@JsonSerializable()
class ProductCategoryModel extends Equatable {
  @JsonKey(name: 'groupId')
  final int groupId;
  @JsonKey(name: 'categoryIds')
  final List<int> categoryIds;
  @JsonKey(name: 'categoryCodes')
  final List<String> categoryCodes;
  @JsonKey(name: 'categoryNames')
  final List<String> categoryNames;
  @JsonKey(name: 'bigImage')
  final String bigImage;
  @JsonKey(name: 'smallImage')
  final String smallImage;

  const ProductCategoryModel(this.groupId, this.categoryIds, this.categoryCodes,
      this.categoryNames, this.bigImage, this.smallImage);

  factory ProductCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$ProductCategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductCategoryModelToJson(this);

  @override
  List<Object?> get props => [
        groupId,
        categoryIds,
        categoryCodes,
        categoryNames,
        bigImage,
        smallImage
      ];
}
