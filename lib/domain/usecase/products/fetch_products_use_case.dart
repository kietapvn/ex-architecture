import 'package:example_architecture/domain/base/base_async_use_case.dart';
import 'package:example_architecture/domain/entity/product.dart';
import 'package:example_architecture/domain/entity/result.dart';
import 'package:example_architecture/domain/repository/products_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class FetchProductsUseCase
    extends BaseAsyncUseCase<FetchProductsParam, Result<List<Product>>> {
  final ProductsRepository productsRepository;

  FetchProductsUseCase(this.productsRepository);

  @override
  Future<Result<List<Product>>> call(FetchProductsParam param) {
    return productsRepository.fetchProducts(param);
  }
}

class FetchProductsParam {
  String? requestId;
  String? token;
  String? name;

  FetchProductsParam({
    this.requestId,
    this.token,
    this.name,
  });
}
