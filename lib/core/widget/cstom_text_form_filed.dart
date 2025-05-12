import 'package:flutter/material.dart';

import '../func/out_line_input_border.dart';

class CustomTextFormFiled extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  final bool obscureText;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final Color? color;
  const CustomTextFormFiled({
    super.key,
    required this.controller,
    this.hintText,
    this.validator,
    this.obscureText = false,
    this.suffixIcon,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        suffixIcon: suffixIcon,
        hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
        errorBorder: outLineInputBorder(color: Colors.red),
        enabledBorder: outLineInputBorder(color: color),
        focusedBorder: outLineInputBorder(color: color),
        disabledBorder: outLineInputBorder(color: color),
        focusedErrorBorder: outLineInputBorder(color: Colors.red),
      ),
    );
  }
}
