import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'update_user_request.g.dart';

@JsonSerializable()
class UpdateUserRequest extends Equatable {
  @JsonKey(name: 'email') final String email;
  @JsonKey(name: 'phoneNumber') final String phoneNumber;
  @JsonKey(name: 'defaultLocation') final String defaultLocation;
  @JsonKey(name: 'fullName') final String fullName;
  @JsonKey(name: 'status') final int status;

  const UpdateUserRequest(this.email, this.phoneNumber, this.defaultLocation, this.fullName, this.status);

  factory UpdateUserRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateUserRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateUserRequestToJson(this);

  @override
  List<Object?> get props => [email, phoneNumber, defaultLocation, fullName, status];
}
