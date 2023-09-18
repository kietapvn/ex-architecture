import 'dart:io';

import 'package:dio/dio.dart';

class ErrorInterceptor extends Interceptor {
  ErrorInterceptor._();
  static ErrorInterceptor instance = ErrorInterceptor._();

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final statusCode = err.response?.statusCode;
    if (statusCode == HttpStatus.unauthorized) {
      // TODO: notify require authentication
    } else if (statusCode == HttpStatus.upgradeRequired) {
      // TODO: must upgrade the app
    }

    /// more error handling
    //...

    super.onError(err, handler);
  }
}
