import 'package:example_architecture/gen/fonts.gen.dart';
import 'package:example_architecture/presentation/base/theme/color/color_andpad.dart';
import 'package:example_architecture/presentation/base/theme/type/text_theme.dart';
import 'package:flutter/material.dart';

final material3LightTheme = buildTheme(AndpadColors.lightColorScheme);

ThemeData buildTheme(ColorScheme colorScheme) {
  final textTheme = getTextTheme(colorScheme);
  return ThemeData(
    useMaterial3: false,
    textTheme: textTheme,
    fontFamily: FontFamily.hiraginoSans,
    appBarTheme: AppBarTheme(
      elevation: 0.5,
      centerTitle: true,
      backgroundColor: Colors.white,
      titleTextStyle: textTheme.titleMedium,
      iconTheme: IconThemeData(
        color: colorScheme.onSurface,
      ),
    ),
    tabBarTheme: TabBarTheme(
      labelColor: colorScheme.primary,
      unselectedLabelColor: colorScheme.onSurface,
      unselectedLabelStyle: textTheme.labelMedium?.copyWith(
        fontWeight: FontWeight.w300,
      ),
      indicatorColor: AndpadColors.indicator,
      labelStyle: textTheme.labelMedium?.copyWith(
        fontWeight: FontWeight.w600,
      ),
    ),
    primarySwatch: AndpadColors.colorPrimarySwatch,
  );
}
