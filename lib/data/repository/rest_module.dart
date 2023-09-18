import 'package:example_architecture/data/repository/dio_client.dart';
import 'package:example_architecture/data/repository/rest_data_source.dart';
import 'package:injectable/injectable.dart';

@module
abstract class RestModule {
  final baseUrl = 'https://dummyjson.com';

  @singleton
  RestDataSource get() => RestDataSource(DioClient(baseUrl));
}
