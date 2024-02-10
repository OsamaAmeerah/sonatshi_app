import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:sonatshi/logic/controller/category_controller.dart';
import 'package:sonatshi/utils/theme.dart';
import 'package:sonatshi/view/widgets/category/caregory_item.dart';

class CategoryWidget extends StatelessWidget {
   CategoryWidget({super.key});

  final controller = Get.find<CategoryController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return ConditionalBuilder(
        condition: !controller.isCategoryLoading.value,
        builder:(context)=> Expanded(
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) => InkWell(
              enableFeedback: true,
              onTap: () {
                controller.getCategoryIndex(index);
                Get.to(()=>  CategoryItem(categoryTitle:controller.categoryNameList[index],));
              },
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: 150.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                    image:  DecorationImage(
                      image: AssetImage(controller.imageCategory[index]),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child:  Padding(
                    padding: const EdgeInsets.only(
                      left: 20.0,
                      bottom: 10.0,
                    ),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        controller.categoryNameList[index],
                        style: const TextStyle(
                          backgroundColor: Colors.black38,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 22.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            separatorBuilder: (context, index) => const Gap(20.0),
            itemCount: controller.categoryNameList.length,
          ),
        ),
        fallback:(context)=>  Center(child: CircularProgressIndicator(
          color: mainLightColor,
        )),
      );
    },
    );
  }
}
