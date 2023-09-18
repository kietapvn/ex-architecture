import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_dto.freezed.dart';
part 'product_dto.g.dart';

@freezed
class ProductDTO with _$ProductDTO {
  factory ProductDTO({
    int? id,
    String? title,
    String? description,
    double? price,
    String? thumbnail,
    List<String>? images,
    String? brand,
    double? rating,
    double? discountPercentage,
  }) = _ProductDTO;

  factory ProductDTO.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$ProductDTOFromJson(json);
}
