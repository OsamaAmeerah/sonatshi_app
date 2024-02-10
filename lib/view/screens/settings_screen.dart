import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:sonatshi/utils/theme.dart';
import 'package:sonatshi/view/widgets/text_utils.dart';

import '../widgets/settings/dark_mode_widget.dart';
import '../widgets/settings/language_widget.dart';
import '../widgets/settings/logout_widget.dart';
import '../widgets/settings/profile_widget.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.colorScheme.background,
      appBar: AppBar(
        leading: Container(),
        backgroundColor: context.theme.colorScheme.background,
        title: const Text('Settings'),
        centerTitle: true,
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(24.0),
        children: [
          ProfileImage(),
          const Gap(10.0),
          const Divider(
            color: Colors.grey,
            thickness: 2.0,
          ),
          const Gap(20.0),
          TextUtils(
            text: 'General'.tr,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: Get.isDarkMode ? Colors.white : mainLightColor,
          ),
          const Gap(
            20.0,
          ),
         DarkModeWidget(),
          const Gap(
            20.0,
          ),
          LanguageWidget(),
          const Gap(
            20.0,
          ),
         LogoutWidget(),
        ],
      ),
    );
  }
}


