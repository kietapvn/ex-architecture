import 'package:dio/dio.dart';

// TODO:
String? get findSomeWhereToGetThisToken => '';

class HeaderInterceptor extends Interceptor {
  HeaderInterceptor._();
  static HeaderInterceptor instance = HeaderInterceptor._();

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final accessToken = findSomeWhereToGetThisToken;
    if (accessToken != null) {
      options.headers['authorization'] = 'Bearer $accessToken';
    }

    handler.next(options);
  }
}
