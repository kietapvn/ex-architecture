import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:example_architecture/foundation/logger/logger.dart';
import 'package:example_architecture/injector/injector.dart';
import 'package:example_architecture/navigation/base/app_router.dart';
import 'package:example_architecture/presentation/base/theme/theme_data/template_app_theme_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

Future<void> main() async {
  await runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

    await EasyLocalization.ensureInitialized();
    await configInjector(GetIt.instance);

    final AppRouter _appRouter = GetIt.I.get();

    runApp(
      ProviderScope(
        child: MaterialApp.router(
          theme: material3LightTheme,
          themeMode: ThemeMode.light,
          routerConfig: _appRouter.config(
            deepLinkBuilder: (deeplink) {
              return deeplink;
            },
          ),
        ),
      ),
    );
  }, (error, stackTrace) async {
    log.d(error);
    log.d(stackTrace);

    /// TODO: Integrate FirebaseCrashlytics
    // await FirebaseCrashlytics.instance.recordError(error, stackTrace);
  });
}
