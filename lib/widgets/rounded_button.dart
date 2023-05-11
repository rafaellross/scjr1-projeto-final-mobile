import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.backgroundColor = Colors.teal,
    this.textColor = Colors.white,

  }) : super(key: key);

  final String text;

  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Material(
        color: backgroundColor,
        elevation: 4,
        borderRadius: const BorderRadius.all(Radius.circular(1000)),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: Text(text,style: TextStyle(fontWeight: FontWeight.bold,color: textColor), ),
          ),
        ),
      ),
    );
  }
}