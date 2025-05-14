import 'package:flutter/material.dart';
import 'package:test_applicarion/feature/category/presentation/theme/category_them.dart';

import '../extensions/my_colors.dart';
import '../func/out_line_input_border.dart';

class AppTheme {
  AppTheme._();

  static ThemeData themeData(BuildContext context) {
    return ThemeData(
      extensions: <ThemeExtension<dynamic>>[
        MyColors.light,
        CategoryTheme.category,
      ],
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: Theme.of(context).textTheme.bodyLarge,
        errorBorder: outLineInputBorder(color: Colors.red, radius: 8),
        enabledBorder: outLineInputBorder(color: Colors.grey, radius: 8),
        focusedBorder: outLineInputBorder(color: Colors.grey, radius: 8),
        disabledBorder: outLineInputBorder(color: Colors.grey, radius: 8),
        focusedErrorBorder: outLineInputBorder(color: Colors.red, radius: 8),
      ),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(
          color: Colors.black,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        titleSmall: TextStyle(color: Colors.black),
        titleMedium: TextStyle(
          color: Colors.black,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  static secondTheme(BuildContext context) {
    return ThemeData(
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: Theme.of(context).textTheme.bodyLarge,
        errorBorder: outLineInputBorder(color: Colors.red, radius: 25),
        enabledBorder: outLineInputBorder(color: Colors.white, radius: 25),
        focusedBorder: outLineInputBorder(color: Colors.white, radius: 25),
        disabledBorder: outLineInputBorder(color: Colors.white, radius: 25),
        focusedErrorBorder: outLineInputBorder(color: Colors.red, radius: 25),
      ),
      extensions: <ThemeExtension<dynamic>>[MyColors.dark],
      textTheme: const TextTheme(
        bodyLarge: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        titleMedium: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
