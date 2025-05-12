import 'package:dio/dio.dart';

abstract class BaseDio {
  //! POST METHOD
  Future<Response<dynamic>> post(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  });
}
