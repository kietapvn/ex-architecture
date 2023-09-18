import 'package:example_architecture/data/repository/dto/products_response.dart';
import 'package:example_architecture/domain/entity/product.dart';
import 'package:injectable/injectable.dart';

@singleton
class ProductsMapper {
  List<Product> mapConstruction(
    ProductsResponse data,
  ) {
    return data.products
        .map(
          (e) => Product(
            id: e.id ?? -1,
            title: e.title ?? '',
            description: e.description ?? '',
            price: e.price ?? 0,
            thumbnail: e.thumbnail ?? '',
            images: e.images ?? [],
            brand: e.brand,
            rating: e.rating,
            discountPercentage: e.discountPercentage,
          ),
        )
        .toList();
  }
}
