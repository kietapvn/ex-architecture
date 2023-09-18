import 'package:flutter/material.dart';

class AndpadColors {
  // カラースケール
  // https://www.figma.com/file/nb7R7wzWxxgGSXytDXMa6n/Colors?node-id=1%3A6138

  // red
  static const Color _red200 = Color(0xFFFFF0F1);
  static const Color _red300 = Color(0xFFFFD9DB);
  static const Color _red400 = Color(0xFFFA8E96);
  static const Color _red500 = Color(0xFFEF3340);
  static const Color _red600 = Color(0xFFE01728);
  static const Color _red700 = Color(0xFFC8102E);

  // blue
  static const Color _blue200 = Color(0xFFEBF9FF);
  static const Color _blue300 = Color(0xFFD0F0FF);
  static const Color _blue400 = Color(0xFF80BFFA);
  static const Color _blue500 = Color(0xFF0572ED);
  static const Color _blue600 = Color(0xFF0459C7);

  // grey
  static const Color _grey50 = Color(0xFFFAFAFB);
  static const Color _grey200 = Color(0xFFEEEFF1);
  static const Color _grey300 = Color(0xFFD0D3D6);
  static const Color _grey400 = Color(0xFFB3B8BD);
  static const Color _grey500 = Color(0xFF868B90);
  static const Color _grey700 = Color(0xFF595C5F);
  static const Color _grey900 = Color(0xFF222222);

  static const Color secondary = Color(0xFF5754A8);
  static const Color onSecondary = Color(0xFFFFFFFF);
  static const Color error = Color(0xFFB3261E);
  static const Color onError = Color(0xFFFFFFFF);
  static const Color background = Color(0xFFFFFFFF);
  static const Color onBackground = Color(0xFF1C1B1F);
  static const Color surface = Color(0xFFFFFBFE);
  static const Color onSurface = Color(0xFF222222);

  static const Color indicator = _red700;
  static const Color shimmerBaseColor = Color(0xFFE8F0F8);
  static const Color shimmerHighlight = Color(0xFFfcfdfe);
  static const Color divider = _grey300;
  static const Color primary = _red700;

  // text
  static const Color text = _grey900;
  static const Color textSub = _grey700;
  static const Color textSubVariant = _grey500;
  static const Color textMainButton = Colors.white;
  static const Color textToolTip = Colors.white;
  static const Color textLink = _grey300;
  static const Color textLight = _grey200;
  static const Color labelNumbering = Colors.white;
  static const Color textRegular = Color(0xFF383839);
  static const Color borderHighLight = Color(0xFFADAFB0);
  static const Color labelHint = _grey300;
  static const Color border = _grey300;

  static const MaterialColor colorPrimarySwatch = MaterialColor(
    0xFFE01728,
    <int, Color>{
      50: _red200,
      100: _red200,
      200: _red200,
      300: _red300,
      400: _red400,
      500: _red500,
      600: _red600,
      700: _red700,
      800: _red700,
      900: _red700,
    },
  );

  static const MaterialColor colorSecondSwatch = MaterialColor(
    0xFF0572ED,
    <int, Color>{
      50: _blue200,
      100: _blue200,
      200: _blue200,
      300: _blue300,
      400: _blue400,
      500: _blue500,
      600: _blue600,
      700: _blue600,
      800: _blue600,
      900: _blue600,
    },
  );

  static const MaterialColor colorTertiarySwatch = MaterialColor(
    0xFF595C5F,
    <int, Color>{
      50: _grey50,
      100: _grey200,
      200: _grey200,
      300: _grey300,
      400: _grey400,
      500: _grey500,
      600: _grey500,
      700: _grey700,
      800: _grey700,
      900: _grey900,
    },
  );

  static const lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: AndpadColors.primary,
    onPrimary: Colors.white,
    secondary: AndpadColors.secondary,
    onSecondary: AndpadColors.onSecondary,
    error: AndpadColors.error,
    onError: AndpadColors.onError,
    background: AndpadColors.background,
    onBackground: AndpadColors.onBackground,
    surface: AndpadColors.surface,
    onSurface: AndpadColors.onSurface,
  );
}
