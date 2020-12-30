import 'package:flutter/material.dart';
import 'package:project_1/constants.dart';

class TextFieldWidget extends StatelessWidget {
  final String hintText;
  final IconData prefixIcon;
  final Widget suffixIcon;
  final bool obscureText;
  final Function onChanged;
  final Function validator;
  final TextEditingController controller;

  TextFieldWidget({
    this.hintText,
    this.obscureText,
    this.onChanged,
    this.prefixIcon,
    this.suffixIcon,
    this.controller,
    this.validator,
  });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      style: TextStyle(
        color: borderAndIconColor,
      ),
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: hintText,
        prefixIcon: Icon(
          prefixIcon,
          size: 18,
          color: borderAndIconColor,
        ),
        enabledBorder: UnderlineInputBorder(borderSide: BorderSide.none),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: borderAndIconColor),
        ),
        suffixIcon: suffixIcon,
        labelStyle: TextStyle(color: borderAndIconColor),
        focusColor: borderAndIconColor,
      ),
    );
  }
}
