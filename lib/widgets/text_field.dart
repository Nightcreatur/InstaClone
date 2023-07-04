import 'package:flutter/material.dart';

class TextFieldInput extends StatelessWidget {
  const TextFieldInput(
      {super.key,
      required this.controller,
      required this.hint,
      required this.textType,
      required this.isPass});
  final TextEditingController controller;
  final String hint;
  final TextInputType textType;
  final bool isPass;

  @override
  Widget build(BuildContext context) {
    final inputBorder =
        OutlineInputBorder(borderSide: Divider.createBorderSide(context));
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hint,
        border: inputBorder,
        enabledBorder: inputBorder,
        filled: true,
        contentPadding: const EdgeInsets.all(8),
      ),
      keyboardType: textType,
      obscureText: isPass,
    );
  }
}
