import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:sonatshi/logic/controller/settings_controller.dart';
import 'package:sonatshi/utils/my_string.dart';
import '../../../utils/theme.dart';
import '../text_utils.dart';

class LanguageWidget extends StatelessWidget {
   LanguageWidget({super.key});
   final controller = Get.find<SettingsController>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingsController>(
      builder:(_)=> Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Material(
            color: Colors.transparent,
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(6.0),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: languageSettings,
                  ),
                  child: const Icon(
                    Icons.language,
                    color: Colors.white,
                  ),
                ),
                const Gap(
                  20.0,
                ),
                TextUtils(
                  text: 'Language'.tr,
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                ),
              ],
            ),
          ),
          Container(
            width: 120.0,
            padding: const EdgeInsets.symmetric(
              horizontal: 6.0,
              vertical: 2.0,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(13.0),
              border: Border.all(
                width: 2.0,
                color: Get.isDarkMode ? Colors.white : Colors.black,
              ),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                onChanged: (String? value) {
                  controller.changeLanguage(value!);
                  Get.updateLocale(Locale(value));
                },
                iconSize: 25.0,
                icon: Icon(
                  Icons.arrow_drop_down,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                ),

                items:  [
                  DropdownMenuItem(
                    value: ene,
                      child: Text(
                    english,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,

                    ),
                  ),),
                  DropdownMenuItem(
                      value: ara,
                      child: Text(
                    arabic,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                  ),
                  DropdownMenuItem(
                    value: frf,
                      child: Text(
                    france,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,

                    ),
                  ),
                  ),
                ],
                value: controller.localLang,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
