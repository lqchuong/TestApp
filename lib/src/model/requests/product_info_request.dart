import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product_info_request.g.dart';

@JsonSerializable()
class ProductInfoRequest extends Equatable {
  @JsonKey(name: 'productName')
  final String productName;

  const ProductInfoRequest(this.productName);

  factory ProductInfoRequest.fromJson(Map<String, dynamic> json) =>
      _$ProductInfoRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ProductInfoRequestToJson(this);

  @override
  List<Object?> get props => [productName];
}
