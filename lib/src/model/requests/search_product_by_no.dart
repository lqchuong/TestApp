import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'search_product_by_no.g.dart';

@JsonSerializable()
class SearchProductByNo extends Equatable {
  @JsonKey(name: 'itemNo') final String itemNo;

  const SearchProductByNo(this.itemNo);

  factory SearchProductByNo.fromJson(Map<String, dynamic> json) =>
      _$SearchProductByNoFromJson(json);

  Map<String, dynamic> toJson() => _$SearchProductByNoToJson(this);


  @override
  List<Object?> get props => [itemNo];
}