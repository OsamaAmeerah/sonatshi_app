import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sonatshi/model/product_model.dart';

import '../../utils/theme.dart';

class CartController extends GetxController {
  var productMap = {}.obs;
  void addProductsToCart(ProductModel productModel) {
    if (productMap.containsKey(productModel)) {
      productMap[productModel] += 1;
    } else {
      productMap[productModel] = 1;
    }
  }

  void removeProductsFromCart(ProductModel productModel) {
    if (productMap.containsKey(productModel) && productMap[productModel] == 1) {
      productMap.removeWhere((key, value) => key == productModel);
    } else {
      productMap[productModel] -= 1;
    }
  }

  void removeSingleProductFromCart(ProductModel productModel) {
    productMap.removeWhere((key, value) => key == productModel);
  }

  void clearAllProducts() {
    Get.defaultDialog(
      title: 'Remove',
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
      onConfirm: () {
        productMap.clear();
        Get.back();
        Get.snackbar('Clear', 'The products cleared successfully',
            animationDuration: const Duration(milliseconds: 500),
          duration: const Duration(milliseconds: 1200)
        );
      },
      buttonColor: Colors.redAccent,
    );
  }

  get productSubTotal =>
      productMap.entries.map((e) => e.key.price * e.value).toList();

  get total => productMap.entries
      .map((e) => e.key.price * e.value)
      .toList()
      .reduce((value, element) => value + element)
      .toStringAsFixed(2);

  int counter() {
    return productMap.entries
        .map((e) => e.value)
        .toList()
        .reduce((value, element) => value + element);
  }
}
