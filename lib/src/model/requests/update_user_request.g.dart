// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_user_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateUserRequest _$UpdateUserRequestFromJson(Map<String, dynamic> json) =>
    UpdateUserRequest(
      json['email'] as String,
      json['phoneNumber'] as String,
      json['defaultLocation'] as String,
      json['fullName'] as String,
      json['status'] as int,
    );

Map<String, dynamic> _$UpdateUserRequestToJson(UpdateUserRequest instance) =>
    <String, dynamic>{
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'defaultLocation': instance.defaultLocation,
      'fullName': instance.fullName,
      'status': instance.status,
    };
