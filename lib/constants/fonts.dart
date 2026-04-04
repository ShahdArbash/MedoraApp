import 'package:flutter/material.dart';

class AppFont {
  static const double chatInputHint = 13.0;
}

class CairoFonts {
  static const String family = 'Cairo';

  static TextStyle regular({
    double fontSize = 14.0,
    Color color = Colors.black,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    double? height,
    double? letterSpacing,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      fontFamily: family,
      fontSize: fontSize,
      color: color,
      fontWeight: fontWeight ?? FontWeight.normal,
      fontStyle: fontStyle,
      height: height,
      letterSpacing: letterSpacing,
      decoration: decoration,
    );
  }

  static TextStyle light({
    double fontSize = 14.0,
    Color color = Colors.black,
    FontStyle? fontStyle,
    double? height,
    double? letterSpacing,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      fontFamily: family,
      fontSize: fontSize,
      color: color,
      fontWeight: FontWeight.w300,
      fontStyle: fontStyle,
      height: height,
      letterSpacing: letterSpacing,
      decoration: decoration,
    );
  }

  static TextStyle extraLight({
    double fontSize = 14.0,
    Color color = Colors.black,
    FontStyle? fontStyle,
    double? height,
    double? letterSpacing,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      fontFamily: family,
      fontSize: fontSize,
      color: color,
      fontWeight: FontWeight.w200,
      fontStyle: fontStyle,
      height: height,
      letterSpacing: letterSpacing,
      decoration: decoration,
    );
  }

  static TextStyle medium({
    double fontSize = 14.0,
    Color color = Colors.black,
    FontStyle? fontStyle,
    double? height,
    double? letterSpacing,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      fontFamily: family,
      fontSize: fontSize,
      color: color,
      fontWeight: FontWeight.w500,
      fontStyle: fontStyle,
      height: height,
      letterSpacing: letterSpacing,
      decoration: decoration,
    );
  }

  static TextStyle semiBold({
    double fontSize = 14.0,
    Color color = Colors.black,
    FontStyle? fontStyle,
    double? height,
    double? letterSpacing,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      fontFamily: family,
      fontSize: fontSize,
      color: color,
      fontWeight: FontWeight.w600,
      fontStyle: fontStyle,
      height: height,
      letterSpacing: letterSpacing,
      decoration: decoration,
    );
  }

  static TextStyle bold({
    double fontSize = 14.0,
    Color color = Colors.black,
    FontStyle? fontStyle,
    double? height,
    double? letterSpacing,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      fontFamily: family,
      fontSize: fontSize,
      color: color,
      fontWeight: FontWeight.w700,
      fontStyle: fontStyle,
      height: height,
      letterSpacing: letterSpacing,
      decoration: decoration,
    );
  }

  static TextStyle extraBold({
    double fontSize = 14.0,
    Color color = Colors.black,
    FontStyle? fontStyle,
    double? height,
    double? letterSpacing,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      fontFamily: family,
      fontSize: fontSize,
      color: color,
      fontWeight: FontWeight.w800,
      fontStyle: fontStyle,
      height: height,
      letterSpacing: letterSpacing,
      decoration: decoration,
    );
  }

  static TextStyle black({
    double fontSize = 14.0,
    Color color = Colors.black,
    FontStyle? fontStyle,
    double? height,
    double? letterSpacing,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      fontFamily: family,
      fontSize: fontSize,
      color: color,
      fontWeight: FontWeight.w900,
      fontStyle: fontStyle,
      height: height,
      letterSpacing: letterSpacing,
      decoration: decoration,
    );
  }
}
