import 'package:freezed_annotation/freezed_annotation.dart';

part 'product.freezed.dart';

@freezed
class Product with _$Product {
  const Product._();

  const factory Product({
    required int id,
    required String title,
    required String description,
    required double price,
    required String thumbnail,
    required List<String> images,
    String? brand,
    double? rating,
    double? discountPercentage,
  }) = _Product;

  double? get discountPrice => discountPercentage != null
      ? price * (100 - discountPercentage!) / 100.0
      : null;
}
