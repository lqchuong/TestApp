import 'package:json_annotation/json_annotation.dart';

part 'base_response.g.dart';

@JsonSerializable(genericArgumentFactories: true, explicitToJson: true)
class BaseResponse<T> {
  @JsonKey(name: 'status')
  final String status;
  @JsonKey(name: 'message')
  final String message;
  @JsonKey(name: 'data')
  final T? data;

  const BaseResponse({required this.status, required this.message, this.data});

  factory BaseResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) {
    return _$BaseResponseFromJson<T>(json, fromJsonT);
  }

  Map<String, dynamic> toJson(
    Map<String, dynamic> Function(T value) toJsonT,
  ) {
    return _$BaseResponseToJson<T>(this, toJsonT);
  }

}
