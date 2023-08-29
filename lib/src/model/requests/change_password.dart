import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'change_password.g.dart';

@JsonSerializable()
class ChangePasswordRequest extends Equatable {
  @JsonKey(name: 'oldPassword')
  final String oldPassword;
  @JsonKey(name: 'newPassword')
  final String newPassword;

  const ChangePasswordRequest(this.oldPassword, this.newPassword);
  factory ChangePasswordRequest.fromJson(Map<String, dynamic> json) =>
      _$ChangePasswordRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ChangePasswordRequestToJson(this);

  @override
  List<Object?> get props => [oldPassword, newPassword];
}
