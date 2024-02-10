import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:sonatshi/logic/controller/settings_controller.dart';
import 'package:sonatshi/utils/theme.dart';
import 'package:sonatshi/view/widgets/text_utils.dart';

import '../../../logic/controller/theme_controller.dart';

class DarkModeWidget extends StatelessWidget {
   DarkModeWidget({super.key});
  final controller = Get.find<SettingsController>();
  @override
  Widget build(BuildContext context) {
    return Obx(()=> Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildIconWidget(),
          Switch(
              value: controller.switchValue.value,
              onChanged: (value){
                ThemeController().changeTheme();
                controller.switchValue.value = value;
              },
          ),
        ],
      ),
    );
  }

  Widget buildIconWidget() => Material(
        color: Colors.transparent,
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(6.0),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: darkSettings,
              ),
              child: const Icon(
                Icons.dark_mode_outlined,
                color: Colors.white,
              ),
            ),
            const Gap(
              20.0,
            ),
             TextUtils(
                text: 'Dark Mode'.tr,
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
                color:Get.isDarkMode ? Colors.white : Colors.black,
            ),
          ],
        ),
      );
}
