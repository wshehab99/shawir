import 'package:flutter/material.dart';

abstract class StyleManager {
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
  static TextStyle semiBold({
    double? fontSize,
    Color? color,
  }) =>
      _getStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.w600,
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
