import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:sonatshi/view/widgets/text_utils.dart';

import '../widgets/category/category_widget.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.colorScheme.background,
      body: Padding(
        padding: const EdgeInsets.only(
          left: 15.0,
          top: 15.0,
        ),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 15.0,
                  top: 15.0,
                ),
                child: TextUtils(
                    text: 'Category',
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                ),
              ),
            ),
            const Gap(20.0),
            CategoryWidget(),
          ],
        ),
      ),
    );
  }
}
