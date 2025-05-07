import 'package:dio/dio.dart';
import 'package:test_applicarion/core/network/dio/base_dio.dart';
import 'package:test_applicarion/feature/login/data/source/base/login_source.dart';

class LoginSourceImpl implements LoginSource {
  final BaseDio _dio;

  LoginSourceImpl(this._dio);
  @override
  Future<Map<String, dynamic>> login({
    required String username,
    required String password,
    required String grantType,
    required String scope,
  }) async {
    try {
      final response = await _dio.post(
        "token",
        data: {
          "username": username,
          "password": password,
          "grant_type": grantType,
          "scope": scope,
        },
        options: Options(
          headers: {"Content-Type": "application/x-www-form-urlencoded"},
        ),
      );
      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}
