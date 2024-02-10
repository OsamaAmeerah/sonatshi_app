import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:sonatshi/logic/controller/main_screen_controller.dart';
import 'package:sonatshi/utils/theme.dart';
class MainScreen extends StatelessWidget {
   MainScreen({super.key});

  final controller = Get.find<MainScreenController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx((){
        return Scaffold(
          backgroundColor: context.theme.colorScheme.background,
          bottomNavigationBar:SizedBox(
            width: 350,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,
                vertical: 20,
              ),
              child: GNav(
                onTabChange: (index) {
                 controller.currentIndex.value = index;
                },
                selectedIndex: controller.currentIndex.value,
                tabActiveBorder: Border.all(color: Get.isDarkMode ? Colors.grey.shade200 : Colors.black, width: 1),
                tabBorder: Border.all(color: Colors.grey, width: 1),
                activeColor: Get.isDarkMode ? Colors.grey[300] : mainLightColor,
                padding: const EdgeInsets.all(16),
                color: Get.isDarkMode ? Colors.white : mainLightColor,
                iconSize: 22.0,
                gap: 4,
                tabs: const [
                  GButton(
                    icon: Icons.home_outlined,
                    text: 'home',
                  ),
                  GButton(
                    icon: Icons.category_outlined,
                    text: 'category',
                  ),
                  GButton(
                    icon: Icons.favorite_outline,
                    text: 'favorite',
                  ),
                  GButton(
                    icon: Icons.settings_outlined,
                    text: 'settings',
                  ),
                ],
              ),
            ),
          ),
          body: IndexedStack(index: controller.currentIndex.value,
          children: controller.tabs,

          ),
        );
      }),
    );
  }
}
