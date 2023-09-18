import 'package:auto_route/auto_route.dart';
import 'package:example_architecture/navigation/base/app_router.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

Future<Widget> buildTestWidget({
  List<Override> overrides = const [],
  Widget? rootWidget,
  AppRouter? appRouter,
}) async {
  if (appRouter == null && rootWidget != null) {
    appRouter = FakeAppRouter(
      HomeExampleRoute.name,
      rootWidget,
    );
    return ProviderScope(
      overrides: overrides,
      child: MaterialApp.router(
        routerConfig: appRouter.config(),
      ),
    );
  }
  if (appRouter != null) {
    return ProviderScope(
      overrides: overrides,
      child: MaterialApp.router(
        routerConfig: appRouter.config(),
      ),
    );
  }
  return const SizedBox.shrink();
}

class FakeAppRouter extends AppRouter {
  FakeAppRouter(this.name, this.widget);

  final String name;
  final Widget widget;

  @override
  Map<String, PageFactory> get pagesMap => {
        name: (routeData) {
          return AutoRoutePage<dynamic>(
            routeData: routeData,
            child: widget,
          );
        },
      };
}
