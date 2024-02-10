import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:sonatshi/logic/controller/cart_controller.dart';
import 'package:sonatshi/utils/theme.dart';
import 'package:sonatshi/view/widgets/text_utils.dart';
import '../../routes/routes.dart';
import '../widgets/home_widget/card_items.dart';
import '../widgets/home_widget/search_text_form.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final controller = Get.put(CartController);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        leading: Container(),
        backgroundColor: Get.isDarkMode ? primaryDarkColor : mainLightColor,
        elevation: 0.0,
        centerTitle: true,
        title: const Text(
          'Products',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: GetX<CartController>(
              builder: (controller) => Badge(
                label: controller.productMap.isNotEmpty
                    ? Text(controller.counter().toString())
                    : const Text('0'),
                alignment: AlignmentDirectional.topEnd,
                child: InkWell(
                  enableFeedback: true,
                  onTap: () {
                    Get.toNamed(Routes.cartScreen);
                  },
                  child: Icon(
                    Icons.shopping_cart_outlined,
                    color: Get.isDarkMode ? Colors.grey[300] : Colors.white,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
      backgroundColor: context.theme.colorScheme.background,
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 180.0,
            decoration: BoxDecoration(
              color: Get.isDarkMode ? primaryDarkColor : mainLightColor,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20.0),
                bottomRight: Radius.circular(20.0),
              ),
            ),
            child:  Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TextUtils(
                    text: 'Find Your',
                    fontSize: 25.0,
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                  ),
                  const Gap(3.0),
                  const TextUtils(
                    text: 'INSPIRATION',
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  const Gap(10.0),
                  SearchTextFormField(),
                ],
              ),
            ),
          ),
          const Gap(10.0),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: TextUtils(
                text: 'Categories',
                fontSize: 20.0,
                fontWeight: FontWeight.w500,
                color: Get.isDarkMode ? Colors.white : Colors.black,
              ),
            ),
          ),
          const Gap(30.0),
          const CardItems(),
        ],
      ),
    ));
  }
}
