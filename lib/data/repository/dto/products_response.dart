import 'package:example_architecture/data/repository/dto/product_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'products_response.freezed.dart';
part 'products_response.g.dart';

@freezed
class ProductsResponse with _$ProductsResponse {
  factory ProductsResponse({
    @Default([]) List<ProductDTO> products,
  }) = _ProductsResponse;

  factory ProductsResponse.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$ProductsResponseFromJson(json);
}
