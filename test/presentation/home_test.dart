import 'package:auto_route/auto_route.dart';
import 'package:example_architecture/domain/entity/result.dart';
import 'package:example_architecture/domain/usecase/products/fetch_products_use_case.dart';
import 'package:example_architecture/navigation/base/app_router.dart';
import 'package:example_architecture/navigation/base/base_navigator.dart';
import 'package:example_architecture/navigation/home/home_navigator.dart';
import 'package:example_architecture/presentation/destinations/home/home_example_page.dart';
import 'package:example_architecture/presentation/destinations/home/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';

import '../models/dummy_product.dart';
import '../utils/test_widget_builder.dart';
import 'home_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<FetchProductsUseCase>(),
])
void main() {
  final usecase = MockFetchProductsUseCase();

  setUpData({bool success = true}) {
    when(usecase.call(any)).thenAnswer(
      (_) async => success
          ? Result.success(
              List.generate(
                20,
                (index) => dummyProduct.copyWith(id: index + 1),
              ),
            )
          : Result.error(Exception()),
    );
  }

  group('HomeExamplePage test - success', () {
    setUp(() {
      GetIt.I.registerSingleton(HomeViewModel(usecase));
    });

    tearDown(() {
      GetIt.I.reset();
    });

    testWidgets('HomeExamplePage test - success', (tester) async {
      setUpData();
      await mockNetworkImages(
        () async {
          await tester.pumpWidget(
            await buildTestWidget(
              rootWidget: const HomeExamplePage(),
            ),
          );
          await tester.pump();
          await tester.pump();

          // Action
          // ... Nothing

          // Assert
          expect(find.byType(ListTile), findsWidgets);
          verify(usecase.call(any));
        },
      );
    });

    testWidgets('HomeExamplePage test - failed', (tester) async {
      setUpData(success: false);
      await mockNetworkImages(
        () async {
          await tester.pumpWidget(
            await buildTestWidget(
              rootWidget: const HomeExamplePage(),
            ),
          );
          await tester.pump();
          await tester.pumpAndSettle();

          // Action
          // ... Nothing

          // Assert
          expect(find.byKey(const Key('error_snack_bar')), findsOneWidget);
          verify(usecase.call(any));
        },
      );
    });
  });

  group('HomeExamplePage test - navigate', () {
    final appRouter = FakeHomeAppRouter();

    setUp(() {
      GetIt.I.registerSingleton(HomeViewModel(usecase));
      GetIt.I.registerSingleton<HomeNavigator>(
        HomeNavigatorImpl(
          navigator: BaseNavigatorImpl(appRouter: appRouter),
        ),
      );
    });

    tearDown(() {
      GetIt.I.reset();
    });

    testWidgets('HomeExamplePage test - navigate to detail', (tester) async {
      setUpData();
      await mockNetworkImages(
        () async {
          await tester.pumpWidget(
            await buildTestWidget(
              appRouter: appRouter,
              rootWidget: const HomeExamplePage(),
            ),
          );
          await tester.pump();
          await tester.pump();

          // Action
          await tester.tap(find.byType(ListTile).first);
          await tester.pump();
          await tester.pump(const Duration(seconds: 1));

          // Assert
          expect(
            find.byKey(const Key('bottom_sheet_overview_item')),
            findsOneWidget,
          );

          // Action
          await tester.tap(find.byType(ElevatedButton));
          await tester.pump();
          await tester.pump();

          // Assert
          expect(find.text('navigated to 1'), findsOneWidget);
        },
      );
    });
  });
}

class FakeHomeAppRouter extends AppRouter {
  @override
  Map<String, PageFactory> get pagesMap => {
        HomeExampleRoute.name: (routeData) {
          return AutoRoutePage<dynamic>(
            routeData: routeData,
            child: const HomeExamplePage(),
          );
        },
        ProductDetailRoute.name: (routeData) {
          final args = routeData.argsAs<ProductDetailRouteArgs>();
          return AutoRoutePage<dynamic>(
            routeData: routeData,
            child: Scaffold(body: Text('navigated to ${args.productId}')),
          );
        },
      };
}
