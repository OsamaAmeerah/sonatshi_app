import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sonatshi/logic/controller/auth_controller.dart';
import 'package:sonatshi/utils/theme.dart';
import 'package:sonatshi/view/widgets/text_utils.dart';

class CheckWidget extends StatelessWidget {
   CheckWidget({super.key});
  final controller = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        GetBuilder<AuthController>(
          builder:(_) {
            return InkWell(
            onTap: (){
             controller.check();
            },
            borderRadius: BorderRadius.circular(10.0),
            child: Container(
               width: 35.0,
              height: 35.0,
              decoration: BoxDecoration(
                color: Get.isDarkMode ? Colors.grey[400] : Colors.grey[300],
                borderRadius: BorderRadius.circular(10.0,),
              ),
              child: controller.isCheck ? Get.isDarkMode ? Icon(Icons.check, color: primaryDarkColor, size: 30.0,)
                  : Icon(Icons.check , color: mainLightColor, size: 30.0,) : null,
            ),
          );
          },
        ),
        const SizedBox(width: 10.0,),
         TextUtils(
            text: 'I accept',
            fontSize: 16,
          fontWeight: FontWeight.normal,
            color: Get.isDarkMode ?  Colors.grey:  Colors.black87,
        ),
        const SizedBox(width: 5.0,),
         TextUtils(
            text: 'terms & conditions',
            fontSize: 16,
          fontWeight: FontWeight.normal,
            color: Get.isDarkMode ?  primaryDarkColor:  Colors.black87,
        )
      ],
    );
  }
}
