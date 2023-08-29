import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'credential_model.g.dart';

@JsonSerializable()
class CredentialModel extends Equatable {
  @JsonKey(name: 'access_token')
  final String accessToken;
  @JsonKey(name: 'token_type')
  final String tokenType;
  @JsonKey(name: 'refresh_token')
  final String refreshToken;
  @JsonKey(name: 'expires_in')
  final int expiresIn;
  @JsonKey(name: 'scope')
  final String scope;
  @JsonKey(name: 'authenResponse')
  final AuthenResponseModel authenResponse;

  static bool isAdmin = false;

  const CredentialModel(
      {required this.accessToken,
      required this.tokenType,
      required this.refreshToken,
      required this.expiresIn,
      required this.scope,
      required this.authenResponse});

  factory CredentialModel.fromJson(Map<String, dynamic> json) =>
      _$CredentialModelFromJson(json);

  Map<String, dynamic> toJson() => _$CredentialModelToJson(this);

  @override
  List<Object?> get props =>
      [accessToken, tokenType, refreshToken, expiresIn, authenResponse];
}

@JsonSerializable()
class AuthenResponseModel extends Equatable {
  @JsonKey(name: 'resultCode')
  final String resultCode;
  @JsonKey(name: 'userName')
  final String userName;
  @JsonKey(name: 'clientId')
  final int clientId;
  @JsonKey(name: 'policy')
  final int policy;

  const AuthenResponseModel(
      this.resultCode, this.userName, this.clientId, this.policy);
  static AuthenResponseModel clientInfo =
      const AuthenResponseModel('', '', 0, 0);

  factory AuthenResponseModel.fromJson(Map<String, dynamic> json) =>
      _$AuthenResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$AuthenResponseModelToJson(this);
  @override
  // TODO: implement props
  List<Object?> get props => [resultCode, userName, clientId, policy];
}
