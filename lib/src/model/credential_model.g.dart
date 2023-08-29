// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'credential_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CredentialModel _$CredentialModelFromJson(Map<String, dynamic> json) =>
    CredentialModel(
      accessToken: json['access_token'] as String,
      tokenType: json['token_type'] as String,
      refreshToken: json['refresh_token'] as String,
      expiresIn: json['expires_in'] as int,
      scope: json['scope'] as String,
      authenResponse: AuthenResponseModel.fromJson(
          json['authenResponse'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CredentialModelToJson(CredentialModel instance) =>
    <String, dynamic>{
      'access_token': instance.accessToken,
      'token_type': instance.tokenType,
      'refresh_token': instance.refreshToken,
      'expires_in': instance.expiresIn,
      'scope': instance.scope,
      'authenResponse': instance.authenResponse,
    };

AuthenResponseModel _$AuthenResponseModelFromJson(Map<String, dynamic> json) =>
    AuthenResponseModel(
      json['resultCode'] as String,
      json['userName'] as String,
      json['clientId'] as int,
      json['policy'] as int,
    );

Map<String, dynamic> _$AuthenResponseModelToJson(
        AuthenResponseModel instance) =>
    <String, dynamic>{
      'resultCode': instance.resultCode,
      'userName': instance.userName,
      'clientId': instance.clientId,
      'policy': instance.policy,
    };
