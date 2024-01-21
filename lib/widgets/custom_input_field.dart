// ignore_for_file: no_leading_underscores_for_local_identifiers, must_be_immutable

//Packages
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final Function(String) onSaved;
  final String regEx;
  final String hintText;
  bool obscureText;

  CustomTextFormField({
    required this.onSaved,
    required this.regEx,
    required this.hintText,
    required this.obscureText,
    super.key, 
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: (_value) => onSaved(_value!),
      cursorColor: Colors.white,
      style: const TextStyle(color: Colors.white),
      obscureText: obscureText,
      validator: (_value) {
        return RegExp(regEx).hasMatch(_value!) ? null : 'Enter a valid value';
      },
      decoration: InputDecoration(
        fillColor: Colors.deepOrange[400],
        filled: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40.0),
          borderSide: BorderSide.none,
        ),
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.white),
      ),
    );
  }
}
