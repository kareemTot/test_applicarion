import 'dart:ui';

import 'package:flutter/material.dart';

class CategoryTheme extends ThemeExtension<CategoryTheme> {
  final Color? backgroundColor;
  final Color? textColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final double? borderRadius;
  final double? imageRadius;
  final double? horizontalPadding;
  final double? verticalPadding;
  final double? margin;
  CategoryTheme({
    required this.backgroundColor,
    required this.textColor,
    required this.fontSize,
    required this.fontWeight,
    required this.borderRadius,
    required this.imageRadius,
    required this.horizontalPadding,
    required this.verticalPadding,
    required this.margin,
  });
  @override
  ThemeExtension<CategoryTheme> copyWith({
    final Color? backgroundColor,
    final Color? textColor,
    final double? fontSize,
    final FontWeight? fontWeight,
    final double? borderRadius,
    final double? imageRadius,
    final double? horizontalPadding,
    final double? verticalPadding,
    final double? margin,
  }) {
    return CategoryTheme(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      textColor: textColor ?? this.textColor,
      fontSize: fontSize ?? this.fontSize,
      fontWeight: fontWeight ?? this.fontWeight,
      borderRadius: borderRadius ?? this.borderRadius,
      imageRadius: imageRadius ?? this.imageRadius,
      horizontalPadding: horizontalPadding ?? this.horizontalPadding,
      verticalPadding: verticalPadding ?? this.verticalPadding,
      margin: margin ?? this.margin,
    );
  }

  @override
  ThemeExtension<CategoryTheme> lerp(
    covariant ThemeExtension<CategoryTheme>? other,
    double t,
  ) {
    if (other is! CategoryTheme) {
      return this;
    } else {
      return CategoryTheme(
        backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t),
        textColor: Color.lerp(textColor, other.textColor, t),
        fontSize: lerpDouble(fontSize, other.fontSize, t),
        fontWeight: FontWeight.lerp(fontWeight, other.fontWeight, t),
        borderRadius: lerpDouble(borderRadius, other.borderRadius, t),
        imageRadius: lerpDouble(imageRadius, other.imageRadius, t),
        horizontalPadding: lerpDouble(
          horizontalPadding,
          other.horizontalPadding,
          t,
        ),
        verticalPadding: lerpDouble(verticalPadding, other.verticalPadding, t),
        margin: lerpDouble(margin, other.margin, t),
      );
    }
  }

  static final category = CategoryTheme(
    backgroundColor: Colors.lightBlue,
    textColor: Colors.white,
    fontSize: 16,
    fontWeight: FontWeight.w500,
    borderRadius: 12,
    imageRadius: 12,
    horizontalPadding: 16,
    verticalPadding: 8,
    margin: 16,
  );
}
