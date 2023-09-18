import 'dart:core';

import 'package:dio/dio.dart';
import 'package:example_architecture/data/repository/dto/products_response.dart';
import 'package:retrofit/retrofit.dart';

part 'rest_data_source.g.dart';

@RestApi()
abstract class RestDataSource {
  factory RestDataSource(Dio dio) = _RestDataSource;

  /// ============================================================
  /// Example
  /// ============================================================

  @GET('/products')
  Future<ProductsResponse> fetchProducts();
}
