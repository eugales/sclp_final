import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:sclp_final/generated/l10n.dart';

class Api {
  late final Dio dio = Dio(options)..interceptors.addAll([_BasicInterceptor()]);

  final options = BaseOptions(
      baseUrl: 'https://fakestoreapi.com',
      connectTimeout: 5000,
      receiveTimeout: 5000);
}

class _BasicInterceptor implements Interceptor {
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == 401) {
      log(S.current.unauthorized, error: err.response?.statusMessage);
    }
    // handler.next(err);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    handler.next(response);
  }
}
