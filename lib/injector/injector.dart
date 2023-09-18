import 'package:example_architecture/injector/injector.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

@InjectableInit(preferRelativeImports: true)
configInjector(
  GetIt getIt, {
  String? env,
  EnvironmentFilter? environmentFilter,
}) {
  return getIt.init(
    environmentFilter: environmentFilter,
    environment: env,
  );
}
