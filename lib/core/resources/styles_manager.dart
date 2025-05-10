import 'package:flutter/material.dart';
import 'package:motor/core/resources/color_manager.dart';
import 'package:motor/core/resources/font_manager.dart';

class StylesManager {
  static TextStyle _getTextStyle(
    double fontSize,
    FontWeight fontWeight,
    Color color,
  ) => TextStyle(
    fontSize: fontSize,
    fontFamily: FontConstants.fontFamily,
    color: color,
    fontWeight: fontWeight,
  );
  static TextStyle getLightStyle({double? fontSize, required Color color}) =>
      _getTextStyle(fontSize ?? FontSize.s12, FontWeightManager.light, color);
  static TextStyle getRegularStyle({double? fontSize, required Color color}) =>
      _getTextStyle(fontSize ?? FontSize.s12, FontWeightManager.regular, color);
  static TextStyle getMediumStyle({double? fontSize, required Color color}) =>
      _getTextStyle(fontSize ?? FontSize.s12, FontWeightManager.medium, color);
  static TextStyle getSemiBoldStyle({double? fontSize, required Color color}) =>
      _getTextStyle(
        fontSize ?? FontSize.s12,
        FontWeightManager.semiBold,
        color,
      );
  static TextStyle getBoldStyle({double? fontSize, required Color color}) =>
      _getTextStyle(fontSize ?? FontSize.s12, FontWeightManager.bold, color);
  static TextStyle getTextWithLine() => TextStyle(
    color: ColorManager.primary,
    fontSize: FontSize.s12,
    fontWeight: FontWeight.w400,
    decoration: TextDecoration.lineThrough,
    decorationColor: ColorManager.primary,
  );
}
