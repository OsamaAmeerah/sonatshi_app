import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sonatshi/utils/theme.dart';
import 'package:sonatshi/view/widgets/text_utils.dart';

class BottomContainer extends StatelessWidget {
  const BottomContainer({super.key, required this.text, required this.onPressed, required this.textButton});
  final String text;
  final String textButton;
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100.0,
      decoration: BoxDecoration(
        color: Get.isDarkMode ?  primaryDarkColor: mainLightColor,
        borderRadius: const BorderRadius.only(
            topRight:Radius.circular(20.0,) ,
            topLeft:Radius.circular(20.0,) ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
              TextUtils(
                  text: text,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
              ),
          TextButton(
            onPressed: onPressed,
            child:TextUtils(
            text: textButton,
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            color: Colors.blueGrey,

          ),
          )
          ],
      ),
    );
  }
}
