import 'package:auto_route/auto_route.dart';
import 'package:example_architecture/domain/entity/product.dart';
import 'package:example_architecture/presentation/base/widget/network_extended_image.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({
    super.key,
    @PathParam('id') required this.productId,
    required this.product,
  });

  final int productId;
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          product.title,
        ),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text(
              RouteData.of(context).route.fullPath,
            ),
          ),
          ListTile(
            title: Text(
              product.title,
            ),
          ),
          ListTile(
            title: Text(
              product.discountPercentage != null
                  ? '${product.discountPrice!.toStringAsFixed(0)} \$'
                  : '${product.price.toStringAsFixed(0)} \$',
            ),
            subtitle: product.discountPercentage != null
                ? Text(
                    '${product.price.toStringAsFixed(0)} \$',
                    style: const TextStyle(
                      decoration: TextDecoration.lineThrough,
                    ),
                  )
                : null,
          ),
          if (product.images.isNotEmpty)
            AspectRatio(
              aspectRatio: 1,
              child: PageView(
                children: [
                  for (final image in product.images)
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: NetworkExtendedImage(
                            image,
                            fit: BoxFit.fill,
                            height: 80,
                            width: 80,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ListTile(
            title: Text(
              product.description,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ],
      ),
    );
  }
}
