import 'package:flutter/material.dart';

class CustomRowText extends StatelessWidget {
  final String title;
  final String value;
  final double? fontSize;
  final FontWeight? fontWeight;
  const CustomRowText({
    super.key,
    required this.title,
    required this.value,
    this.fontSize,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Text(
            title,
            style: TextStyle(
              fontSize: fontSize ?? 14,
              fontWeight: fontWeight ?? FontWeight.w500,
            ),
          ),
        ),
        Flexible(child: FittedBox(child: Text(value))),
      ],
    );
  }
}
