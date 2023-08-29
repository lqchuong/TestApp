import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'search_product_by_barcode_request.g.dart';

@JsonSerializable()
class SearchProductByBarcodeRequest extends Equatable {
  @JsonKey(name: 'barcode') final String barcode;

  const SearchProductByBarcodeRequest(this.barcode);

  factory SearchProductByBarcodeRequest.fromJson(Map<String, dynamic> json) =>
      _$SearchProductByBarcodeRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SearchProductByBarcodeRequestToJson(this);

  @override
  List<Object?> get props => [barcode];
}