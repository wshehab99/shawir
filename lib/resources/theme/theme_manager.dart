import 'package:flutter/material.dart';
import 'package:shawir/resources/colors/app_colors.dart';

import '../style/input_border_manager.dart';
import '../style/style_manager.dart';

abstract class ThemeManager {
  static final ThemeData theme = ThemeData(
    appBarTheme: AppBarTheme(
      centerTitle: true,
      titleTextStyle:
          StyleManager.regular(color: AppColors.appBarTitle, fontSize: 24),
      iconTheme: const IconThemeData(
        color: AppColors.appBarTitle,
      ),
    ),
    iconTheme: const IconThemeData(
      color: AppColors.appBarTitle,
    ),
    textTheme: TextTheme(
      headlineMedium: StyleManager.regular(
        fontSize: 18,
        color: AppColors.appBarTitle,
      ),
      titleMedium: StyleManager.regular(
        fontSize: 24,
        color: AppColors.white,
      ),
      titleSmall: StyleManager.semiBold(
        fontSize: 18,
        color: AppColors.appBarTitle,
      ),
      bodyMedium: StyleManager.regular(
        fontSize: 18,
        color: AppColors.border,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      isDense: true,
      border: InputBorderManager.border(AppColors.borderOpacity80),
      focusedBorder: InputBorderManager.border(AppColors.appBarTitle),
      hintStyle: StyleManager.regular(
        fontSize: 16,
        color: AppColors.borderOpacity80,
      ),
      counterStyle: StyleManager.semiBold(
        fontSize: 14,
        color: AppColors.skyBlue,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all<Color>(AppColors.appBarTitle),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        textStyle: WidgetStateProperty.all(StyleManager.regular(
          fontSize: 24,
          color: AppColors.white,
        )),
      ),
    ),
  );
}
