import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final Color borderColor;
  final String hintText;
  final String labelText;

  const CustomTextField({
    Key? key,
    required this.borderColor,
    required this.hintText,
    required this.labelText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: borderColor,
          ),
        ),
        hintText: hintText,
        labelText: labelText,
      ),
    );
  }
}