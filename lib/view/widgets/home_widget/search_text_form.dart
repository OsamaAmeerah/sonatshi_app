import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sonatshi/logic/controller/product_controller.dart';

import '../../../utils/theme.dart';

class SearchTextFormField extends StatelessWidget {
   SearchTextFormField({super.key});
  final controller = Get.find<ProductController>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(
      builder: (controller)=> TextField(
        onChanged: (searchName){
          controller.addSearchToList(searchName);
        },
        controller: controller.searchTextController,
        style: TextStyle(
          color: mainBackDarkColor,
        ),
        cursorColor: Get.isDarkMode ? Colors.grey : mainBackDarkColor,
        decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.search_outlined,
            color: Colors.grey,
          ),

          suffixIcon: controller.searchTextController.text.isNotEmpty ? IconButton(onPressed: () {
            controller.clearSearch();
          },
              icon: const Icon(Icons.close_rounded,color: Colors.grey,)) : null,
          filled: true,
          fillColor: Colors.white,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Get.isDarkMode ? primaryDarkColor : mainLightColor,
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Get.isDarkMode ? primaryDarkColor : mainLightColor,
              ),
              borderRadius: BorderRadius.circular(10.0)),
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Get.isDarkMode ? primaryDarkColor : mainLightColor,
              ),
              borderRadius: BorderRadius.circular(10.0)),
          focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Get.isDarkMode ? primaryDarkColor : mainLightColor,
              ),
              borderRadius: BorderRadius.circular(10.0)),
          hintStyle: const TextStyle(
            fontSize: 16.0,
            color: Colors.grey,
          ),
          hintText: 'Search with name & price',
        ),
      ),
    );
  }
}
