import 'package:example_architecture/domain/entity/product.dart';
import 'package:example_architecture/domain/entity/result.dart';
import 'package:example_architecture/domain/usecase/products/fetch_products_use_case.dart';

mixin ProductsRepository {
  Future<Result<List<Product>>> fetchProducts(
    FetchProductsParam param,
  );
}
