import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:sonatshi/logic/controller/auth_controller.dart';
import '../../../utils/theme.dart';
import '../text_utils.dart';

class LogoutWidget extends StatelessWidget {
   LogoutWidget({super.key});
  final controller = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      builder:(controller)=> Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: (){
            Get.defaultDialog(
              title: 'Logout',
              titleStyle: TextStyle(
                color: Get.isDarkMode ? Colors.grey[300] : mainLightColor,
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
              middleText: 'Are you sure?',
              middleTextStyle: TextStyle(
                color: Get.isDarkMode ? Colors.grey[300] : mainLightColor,
              ),
              radius: 15.0,
              textCancel: 'Cancel',
              textConfirm: 'Confirm',
              onConfirm: (){
                controller.signOut();
              },
              buttonColor: Colors.redAccent,
            );
          },
          splashColor: Get.isDarkMode ? Colors.grey : Colors.green[100],
          borderRadius: BorderRadius.circular(12.0,),
          customBorder: const StadiumBorder(),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(6.0),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: logOutSettings,
                ),
                child: const Icon(
                  Icons.logout_outlined,
                  color: Colors.white,
                ),
              ),
              const Gap(
                20.0,
              ),
              TextUtils(
                text: 'Logout'.tr,
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
                color:Get.isDarkMode ? Colors.white : Colors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
