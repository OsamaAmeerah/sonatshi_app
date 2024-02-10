import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/theme.dart';

class AuthTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final InputDecoration? decoration;
  final bool isPassword;
  final Color? suffixIconColor;
  final Color? prefixIconColor;
  final InputBorder? enabledBorderStyle;
  final InputBorder? focusedBorderStyle;
  final TextStyle? style;
  final TextStyle? labelStyle;
  final void Function(String)? onChange;
  final void Function()? onTap;
  final void Function()? suffixPressed;
  final String label;
  final bool isClickable = true;
  final Widget? prefix;
  final Widget? suffix;
  final dynamic validate;
  const AuthTextFormField({
    super.key,
    required this.controller,
    this.decoration,
    required this.isPassword,
    this.suffixIconColor,
    this.prefixIconColor,
    this.enabledBorderStyle,
    this.focusedBorderStyle,
    this.style,
    this.labelStyle,
    this.onChange,
    this.onTap,
    this.suffixPressed,
    required this.label,
    this.prefix,
    this.suffix,
    this.validate,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(
        color: mainBackDarkColor,
      ),
      validator: validate,
      controller: controller,
      obscureText: isPassword,
      cursorColor: Colors.black,
      decoration: InputDecoration(
        suffixIconColor: suffixIconColor,
        prefixIconColor: prefixIconColor,
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black,),
          borderRadius: BorderRadius.circular(10.0),
        ),
        enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.black),
        borderRadius: BorderRadius.circular(10.0)),
        errorBorder:   OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black),
            borderRadius: BorderRadius.circular(10.0)),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black),
            borderRadius: BorderRadius.circular(10.0)),
        labelText: label,
        labelStyle: labelStyle,
        prefixIcon: prefix,
        suffixIcon: suffix,
        filled: true,
        fillColor: Get.isDarkMode ? Colors.grey[400] :Colors.grey[200],
        border: const OutlineInputBorder(),
      ),
    );
  }
}
