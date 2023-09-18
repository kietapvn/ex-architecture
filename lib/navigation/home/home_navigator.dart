import 'package:example_architecture/domain/entity/product.dart';
import 'package:example_architecture/navigation/base/app_router.dart';
import 'package:example_architecture/navigation/base/base_navigator.dart';
import 'package:injectable/injectable.dart';

abstract class HomeNavigator {
  Future<dynamic> toDetailScreen(int productId, Product product);
}

@Injectable(as: HomeNavigator)
class HomeNavigatorImpl implements HomeNavigator {
  final BaseNavigator navigator;

  const HomeNavigatorImpl({required this.navigator});

  @override
  Future<dynamic> toDetailScreen(int productId, Product product) {
    return navigator.to(
      ProductDetailRoute(
        productId: productId,
        product: product,
      ),
    );
  }
}
