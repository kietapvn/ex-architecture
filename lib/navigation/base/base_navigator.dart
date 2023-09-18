import 'package:auto_route/auto_route.dart';
import 'package:example_architecture/navigation/base/app_router.dart';
import 'package:injectable/injectable.dart';

abstract class BaseNavigator {
  Future<dynamic> to(PageRouteInfo route);

  void back();

  void popUntilTop();

  void pop(dynamic result);

  void toTabsRouter(String routeName, PageRouteInfo route);
}

@Singleton(as: BaseNavigator)
class BaseNavigatorImpl implements BaseNavigator {
  final AppRouter appRouter;
  bool isTokenExpired = false;

  BaseNavigatorImpl({
    required this.appRouter,
  });

  @override
  void back() {
    appRouter.back();
  }

  @override
  Future<void> to(PageRouteInfo route) {
    return appRouter.push(route);
  }

  @override
  void popUntilTop() {
    appRouter.popUntil((route) => route.settings.name == '/');
  }

  @override
  void pop(dynamic result) {
    appRouter.pop(result);
  }

  @override
  void toTabsRouter(String routeName, PageRouteInfo route) {
    final tabRouter = appRouter.innerRouterOf<TabsRouter>(routeName);
    tabRouter?.navigate(route);
  }
}
