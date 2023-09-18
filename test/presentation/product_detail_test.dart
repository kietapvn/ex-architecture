import 'package:example_architecture/presentation/destinations/product_detail/product_detail_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';

import '../models/dummy_product.dart';
import '../utils/test_widget_builder.dart';

void main() {
  group('ProductDetailPage test - success', () {
    testWidgets('ProductDetailPage test - UI', (tester) async {
      await mockNetworkImages(
        () async {
          await tester.pumpWidget(
            await buildTestWidget(
              rootWidget: ProductDetailPage(
                productId: 1,
                product: dummyProduct.copyWith(
                  discountPercentage: 19.3,
                  images: ['img1', 'img2'],
                ),
              ),
            ),
          );
          await tester.pump();

          // Action
          // ... Nothing

          // Assert
          expect(find.text(dummyProduct.title), findsWidgets);

          // Action
          await tester.drag(find.byType(ListView), const Offset(0, -500));
          await tester.pump();

          // Assert
          expect(find.text(dummyProduct.description), findsOneWidget);
        },
      );
    });
  });
}
