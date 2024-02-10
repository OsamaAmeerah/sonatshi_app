import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:sonatshi/logic/controller/auth_controller.dart';
import 'package:sonatshi/logic/controller/settings_controller.dart';
import 'package:sonatshi/view/widgets/text_utils.dart';

class ProfileImage extends StatelessWidget {
   ProfileImage({super.key});
   final controller = Get.find<SettingsController>();
   final authController = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
          Row(
            children: [
              if(authController.displayUserImage.isNotEmpty)
                Container(
                height: 100.0,
                width: 100.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(
                      authController.displayUserImage,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              if(authController.displayUserImage.isNotEmpty)
                const Gap(
                15.0,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextUtils(
                      text: controller.capitalize(
                          authController.displayUserName),
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                    ),
                    TextUtils(
                      text: authController.displayUserEmail,
                      fontSize: 14.0,
                      fontWeight: FontWeight.normal,
                      color: Colors.grey,
                    ),

                  ],
                ),
              ),
            ],
          ),
      ],
    );
  }
}
