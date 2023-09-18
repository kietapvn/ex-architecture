import 'package:example_architecture/data/repository/products/products_mapper.dart';
import 'package:example_architecture/data/repository/rest_data_source.dart';
import 'package:example_architecture/domain/entity/product.dart';
import 'package:example_architecture/domain/entity/result.dart';
import 'package:example_architecture/domain/repository/products_repository.dart';
import 'package:example_architecture/domain/usecase/products/fetch_products_use_case.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ProductsRepository)
class ProductRepositoryImpl with ProductsRepository {
  final RestDataSource dataSource;
  final ProductsMapper productsMapper;

  ProductRepositoryImpl({
    required this.dataSource,
    required this.productsMapper,
  });

  @override
  Future<Result<List<Product>>> fetchProducts(FetchProductsParam param) async {
    try {
      final data = await dataSource.fetchProducts();
      return Result.success(productsMapper.mapConstruction(data));
    } on Exception catch (e) {
      return Result.error(e);
    }
  }
}
