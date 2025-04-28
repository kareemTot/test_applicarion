import 'package:flutter/material.dart';

import '../func/out_line_input_border.dart';

class CustomTextFormFiled extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  final bool obscureText;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  const CustomTextFormFiled({
    super.key,
    required this.controller,
    this.hintText,
    this.validator,
    this.obscureText = false,
    this.suffixIcon,
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
        enabledBorder: outLineInputBorder(),
        focusedBorder: outLineInputBorder(),
        disabledBorder: outLineInputBorder(),
        focusedErrorBorder: outLineInputBorder(color: Colors.red),
      ),
    );
  }
}
