import 'package:auto_route/auto_route.dart';
import 'package:example_architecture/domain/entity/product.dart';
import 'package:example_architecture/presentation/destinations/home/home_example_page.dart';
import 'package:example_architecture/presentation/destinations/product_detail/product_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

part 'app_router.gr.dart';

@Singleton()
@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          path: '/',
          page: HomeExampleRoute.page,
          initial: true,
        ),
        AutoRoute(
          path: '/detail/:id',
          page: ProductDetailRoute.page,
        ),
      ];
}
