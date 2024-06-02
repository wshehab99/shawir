import 'package:flutter/material.dart';
import 'package:shawir/resources/colors/app_colors.dart';

abstract class ThemeManager {
  static final ThemeData theme = ThemeData(
    appBarTheme: AppBarTheme(
      centerTitle: true,
      
      titleTextStyle:
          StyleManager.regular(color: AppColors.appBarTitle, fontSize: 24),
      iconTheme: IconThemeData(
        color: AppColors.appBarTitle,
      ),
    ),
    iconTheme: IconThemeData(
      color: AppColors.appBarTitle,
    ),
  );
}

class StyleManager {
  static TextStyle _getStyle({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
  }) =>
      TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
      );
  static TextStyle bold({
    double? fontSize,
    Color? color,
  }) =>
      _getStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
        color: color,
      );
  static TextStyle regular({
    double? fontSize,
    Color? color,
  }) =>
      _getStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.w400,
        color: color,
      );
}
