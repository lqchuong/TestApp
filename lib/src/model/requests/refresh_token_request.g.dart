// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'refresh_token_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RefreshTokenRequest _$RefreshTokenRequestFromJson(Map<String, dynamic> json) =>
    RefreshTokenRequest(
      json['accessToken'] as String,
      json['refreshToken'] as String,
    );

Map<String, dynamic> _$RefreshTokenRequestToJson(
        RefreshTokenRequest instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
    };
