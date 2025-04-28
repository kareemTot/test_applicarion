import 'package:flutter/material.dart';

InputBorder outLineInputBorder({Color? color}) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: BorderSide(color: color ?? Colors.orange),
  );
}
