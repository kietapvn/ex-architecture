import 'package:example_architecture/gen/fonts.gen.dart';
import 'package:flutter/material.dart';

TextTheme getTextTheme(ColorScheme colorScheme) {
  return TextTheme(
    displaySmall: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: Color(0xFFADAFB0),
    ),
    titleLarge: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w500,
      color: colorScheme.onSurface,
    ),
    titleMedium: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: colorScheme.onSurface,
      fontFamily: FontFamily.hiraginoSans,
    ),
    titleSmall: TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w400,
      color: colorScheme.onSurface,
      fontFamily: FontFamily.hiraginoSans,
    ),
    bodyLarge: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: colorScheme.onSurface,
    ),
    bodyMedium: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: colorScheme.onSurface,
    ),
    bodySmall: TextStyle(
      fontSize: 13,
      fontWeight: FontWeight.w300,
      color: colorScheme.onSurface,
      fontFamily: FontFamily.hiraginoKakuGothicPro,
    ),
    labelMedium: TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w600,
      color: colorScheme.onSurface,
    ),
  );
}
