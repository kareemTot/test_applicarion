import 'package:equatable/equatable.dart';

class LoginModel extends Equatable {
  final String? accessToken;
  final String? tokenType;
  final int? expiresIn;
  final String? refreshToken;

  const LoginModel({
    this.accessToken,
    this.tokenType,
    this.expiresIn,
    this.refreshToken,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    accessToken: json['access_token'] as String?,
    tokenType: json['token_type'] as String?,
    expiresIn: json['expires_in'] as int?,
    refreshToken: json['refresh_token'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'access_token': accessToken,
    'token_type': tokenType,
    'expires_in': expiresIn,
    'refresh_token': refreshToken,
  };

  @override
  List<Object?> get props {
    return [accessToken, tokenType, expiresIn, refreshToken];
  }
}
