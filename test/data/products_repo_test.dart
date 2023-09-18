import 'package:dio/dio.dart';
import 'package:example_architecture/data/repository/dio_client.dart';
import 'package:example_architecture/data/repository/products/products_mapper.dart';
import 'package:example_architecture/data/repository/products/products_repository.dart';
import 'package:example_architecture/data/repository/rest_data_source.dart';
import 'package:example_architecture/domain/usecase/products/fetch_products_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

import '../jsons/error_json.dart';
import '../jsons/product_json.dart';

void main() {
  final dio = Dio(BaseOptions());
  final dioAdapter = DioAdapter(dio: dio);

  setUpData({bool success = true}) {
    dioAdapter.onGet(
      '/products',
      (server) => success
          ? server.reply(
              200,
              productJson,
              delay: const Duration(seconds: 1),
            )
          : server.reply(
              401,
              errorJson,
              delay: const Duration(seconds: 1),
            ),
    );
  }

  group('ProductsRepository test', () {
    test('ProductsRepository test - success', () async {
      setUpData();
      final repo = ProductRepositoryImpl(
        dataSource: RestDataSource(dio),
        productsMapper: ProductsMapper(),
      );

      // Action
      final data = await repo.fetchProducts(FetchProductsParam());

      // Assert
      expect(data.isSuccess, isTrue);
      expect(data.dataOrThrow.length, 20);
    });

    test('ProductsRepository test - failed', () async {
      setUpData(success: false);
      final repo = ProductRepositoryImpl(
        dataSource: RestDataSource(DioClient('')),
        productsMapper: ProductsMapper(),
      );

      // Action
      final data = await repo.fetchProducts(FetchProductsParam());

      // Assert
      expect(data.isSuccess, isFalse);
      expect(() => data.dataOrThrow, throwsA(isA<Exception>()));
    });
  });
}
