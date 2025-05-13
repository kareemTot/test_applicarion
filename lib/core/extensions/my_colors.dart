import 'package:flutter/material.dart';

class MyColors extends ThemeExtension<MyColors> {
  final Color? primaryColor;
  final Color? textInputborderColors;
  final Color? textInputborderErrorColors;

  MyColors({
    required this.primaryColor,
    this.textInputborderColors,
    this.textInputborderErrorColors,
  });
  @override
  ThemeExtension<MyColors> copyWith({Color? primaryColor}) {
    return MyColors(primaryColor: primaryColor ?? this.primaryColor);
  }

  @override
  ThemeExtension<MyColors> lerp(
    covariant ThemeExtension<MyColors>? other,
    double t,
  ) {
    if (other is! MyColors) {
      return this;
    }
    return MyColors(
      primaryColor: Color.lerp(primaryColor, other.primaryColor, t),
    );
  }

  @override
  String toString() {
    return "MyColors(primaryColor: $primaryColor)";
  }

  static final light = MyColors(
    primaryColor: Colors.orange,
    textInputborderColors: Colors.grey,
    textInputborderErrorColors: Colors.red,
  );
  static final dark = MyColors(
    primaryColor: Colors.blueAccent,
    textInputborderColors: Colors.white,
    textInputborderErrorColors: Colors.red,
  );
}
