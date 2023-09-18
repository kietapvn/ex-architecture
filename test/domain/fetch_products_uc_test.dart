import 'package:example_architecture/domain/entity/result.dart';
import 'package:example_architecture/domain/repository/products_repository.dart';
import 'package:example_architecture/domain/usecase/products/fetch_products_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../models/dummy_product.dart';
import 'fetch_products_uc_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<ProductsRepository>(),
])
void main() {
  final repo = MockProductsRepository();

  setUpData({bool success = true}) {
    when(repo.fetchProducts(any)).thenAnswer(
      (_) async => success
          ? Result.success(
              List.generate(
                20,
                (index) => dummyProduct.copyWith(id: index),
              ),
            )
          : Result.error(Exception()),
    );
  }

  group('FetchProductsUseCase test', () {
    test('FetchProductsUseCase test - success', () async {
      setUpData();
      final useCase = FetchProductsUseCase(repo);

      // Action
      final result = await useCase.call(FetchProductsParam());

      // Assert
      expect(result.isSuccess, isTrue);
      expect(result.dataOrThrow.length, 20);
    });

    test('FetchProductsUseCase test - failed', () async {
      setUpData(success: false);
      final useCase = FetchProductsUseCase(repo);

      // Action
      final result = await useCase.call(FetchProductsParam());

      // Assert
      expect(result.isSuccess, isFalse);
      expect(() => result.dataOrThrow, throwsA(isA<Exception>()));
    });
  });
}
