import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:example_architecture/data/repository/error_interceptor.dart';
import 'package:example_architecture/data/repository/header_interceptor.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class DioClient extends DioMixin implements Dio {
  DioClient(String baseUrl) {
    httpClientAdapter = IOHttpClientAdapter();

    options = BaseOptions(
      baseUrl: baseUrl,
      contentType: 'application/json',
      connectTimeout: const Duration(milliseconds: 30000),
      sendTimeout: const Duration(milliseconds: 30000),
      receiveTimeout: const Duration(milliseconds: 30000),
    );

    interceptors.add(HeaderInterceptor.instance);
    interceptors.add(ErrorInterceptor.instance);
    interceptors.add(
      LogInterceptor(
        requestBody: true,
        responseHeader: false,
        responseBody: true,
      ),
    );
  }
}
