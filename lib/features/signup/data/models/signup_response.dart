import 'package:json_annotation/json_annotation.dart';

part 'signup_response.g.dart';
@JsonSerializable()
class SignupResponse{

  final String message;
  @JsonKey(name: 'data')
  UserData userData;
  final bool status;
  final int code;

  SignupResponse({required this.message, required this.userData, required this.status, required this.code});

  factory SignupResponse.fromJson(Map<String, dynamic> json) => _$SignupResponseFromJson(json);

}

@JsonSerializable()
class UserData {
  final String token;
  @JsonKey(name: 'username')
  final String userName;

  UserData({required this.token, required this.userName});

  factory UserData.fromJson(Map<String, dynamic> json) => _$UserDataFromJson(json);
}