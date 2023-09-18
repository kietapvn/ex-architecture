import 'package:example_architecture/presentation/base/theme/color/color_andpad.dart';
import 'package:flutter/material.dart';

// https://www.figma.com/file/WkcOpCebn7oGIWnBpnYzOY/Components_inspection?node-id=0%3A1
// 上記デザイン資料に定義されているスタイルを定義。
// 色はAndpadColors.textを基本とする。
// それ以外の色については[スタイル名][AndpadColorsの色名]で定義する。
// 基本的にはここで定義されているスタイル以外は使用しない（デザインでもこれ以外のスタイルは指定されない想定）
class AndpadTextStyles {
  static const TextStyle title0 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w400,
    color: AndpadColors.text,
  );

  static const TextStyle title1 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: AndpadColors.text,
  );

  static const TextStyle title1Sub = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w400,
    color: AndpadColors.text,
  );

  static const TextStyle title2 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AndpadColors.text,
  );

  static const TextStyle title3 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AndpadColors.text,
  );

  static const TextStyle body1 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AndpadColors.text,
  );

  static const TextStyle body1White = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AndpadColors.labelNumbering,
  );

  static const TextStyle body1bold = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AndpadColors.text,
  );

  static const TextStyle body1boldSub = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AndpadColors.textSub,
  );

  static const TextStyle body1Sub = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AndpadColors.textSub,
  );

  static const TextStyle body1SubVariant = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AndpadColors.textSubVariant,
  );

  static const TextStyle body2 = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AndpadColors.text,
  );

  static const TextStyle body2Sub = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AndpadColors.textSub,
  );

  static const TextStyle body2SubVariant = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AndpadColors.textSubVariant,
  );

  static const TextStyle label = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AndpadColors.text,
  );

  static const TextStyle labelLight = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AndpadColors.textLight,
  );

  static const TextStyle button0 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AndpadColors.text,
  );

  static const TextStyle button1 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AndpadColors.text,
  );

  static const TextStyle button1MainButton = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AndpadColors.textMainButton,
  );

  static const TextStyle button2 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AndpadColors.text,
  );

  static const TextStyle bottomH3 = TextStyle(
    fontSize: 14,
    height: 1.5,
    color: AndpadColors.text,
  );

  static const TextStyle badge = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AndpadColors.textToolTip,
  );

  static const TextStyle outlineButtonLabel = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w400,
    color: AndpadColors.textRegular,
  );

  static const TextStyle constructionLabel = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AndpadColors.textRegular,
  );
}
