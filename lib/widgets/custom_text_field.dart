import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final TextEditingController controller;
  final TextInputType? keyboardType;

  final int? minLine;
  final int? maxLine;
  const CustomTextField({
    super.key,
    required this.controller,
    this.maxLine,
    this.minLine,
    required this.labelText,
    required this.hintText,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      minLines: minLine,
      maxLines: maxLine,
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          alignLabelWithHint: true,
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5)))),
    );
  }
}
