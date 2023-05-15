import 'package:flutter/material.dart';

class RoundedTextField extends StatelessWidget {
  const RoundedTextField({
    super.key,
    required this.hint,
    required this.onTextChange,
    this.textInputType = TextInputType.text,
    this.obscureText = false,

  });

  final String hint;
  final TextInputType textInputType;
  final bool obscureText;
  final Function(String) onTextChange;


  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(
        color: Colors.white,
      ),

      onChanged: onTextChange,
      keyboardType: textInputType,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: hint,
        labelStyle: const TextStyle(
          color: Colors.white
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(1000),

        ),

      ),
    );
  }
}

