import 'package:flutter/material.dart';

class AdminTextField extends StatelessWidget {
  const AdminTextField({
    super.key,
    required this.label,
    this.controller,
    this.readOnly,
    this.onTap,
  });

  final String label;
  final TextEditingController? controller;
  final bool? readOnly;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 7),
      child: TextFormField(
        validator: (value) {
          if (value == "" || value == null) {
            return "Vui lòng điền thông tin";
          }
          return null;
        },
        onTap: onTap,
        readOnly: readOnly ?? false,
        controller: controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          labelText: label,
        ),
      ),
    );
  }
}
