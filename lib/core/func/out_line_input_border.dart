import 'package:flutter/material.dart';

InputBorder outLineInputBorder({Color? color, double? radius}) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(radius ?? 8),
    borderSide: BorderSide(color: color ?? Colors.orange),
  );
}
