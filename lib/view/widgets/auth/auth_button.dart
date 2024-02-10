import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sonatshi/utils/theme.dart';
import 'package:sonatshi/view/widgets/text_utils.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({super.key, required this.text, required this.onPressed});
  final String text;
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
    style: ElevatedButton.styleFrom(
      backgroundColor:Get.isDarkMode ?  primaryDarkColor: mainLightColor,
      minimumSize: const Size(360, 50),
    ),
        child:  TextUtils(
            text: text,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: Colors.white),
    );
  }
}
