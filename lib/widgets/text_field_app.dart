import 'package:flutter/material.dart';

class TextFieldApp extends StatelessWidget {
  const TextFieldApp(
      {super.key,
      this.hintText,
      this.suffixIcon,
      this.fillColor,
      this.label,
      this.maxLines,
      this.textInputType,
      this.validator,
      this.controller,
      this.prefixIcon});
  final String? hintText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Color? fillColor;
  final Widget? label;
  final int? maxLines;
  final String? Function(String?)? validator;
  final TextInputType? textInputType;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
          borderSide: BorderSide.none,
        ),
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
      ),
    );
  }
}
