import 'dart:developer';
import 'package:dio/dio.dart';
import '../../cache/app_shared_pref.dart';
import '../../constant/constant.dart';

class DioInterceptor implements Interceptor {
  DioInterceptor();
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    log("=======================================");
    log("====================${err.toString()}");
    handler.next(err);
  }

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await SharedPref().get(tokenValue);
    options.headers["Authorization"] = "Bearer $token";
    log("=======================================");
    log("Request");
    log("url:=> ${options.path}");
    log("content:=> ${options.contentType}");
    log("headers:=> hasToken:${token.toString()}");
    log("body:=> ${options.data != null ? options.data! : "Data is null"}");
    log("=======================================");
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    log("=======================================");
    log("Response:");
    log("url:=> ${response.requestOptions.path}");
    log("statusCode:=> ${response.statusCode}");
    log("body:=> hasData: ${response.data != null}");
    log("=======================================");

    if (response.statusCode == 401 ||
        response.statusCode == 302 ||
        response.data.toString().toLowerCase().contains("unauthorized")) {
      await SharedPref().removeToken();
    }
    handler.next(response);
  }
}
