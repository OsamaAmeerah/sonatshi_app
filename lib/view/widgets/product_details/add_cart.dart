import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:sonatshi/logic/controller/cart_controller.dart';
import 'package:sonatshi/model/product_model.dart';
import 'package:sonatshi/utils/theme.dart';
import 'package:sonatshi/view/widgets/text_utils.dart';

class AddCart extends StatelessWidget {
  final double price;
  final ProductModel productModel;
   AddCart({super.key, required this.price, required this.productModel});
  final controller = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(25.0),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TextUtils(
                text: 'price',
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
              Text(
                '\$$price',
                style: TextStyle(
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  height: 1.5,
                ),
              ),
            ],
          ),
          const Gap(20.0),
          Expanded(
            child: SizedBox(
              height: 60.0,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  backgroundColor:
                      Get.isDarkMode ? primaryDarkColor : mainLightColor,
                  elevation: 0.0,
                ),
                onPressed: () {
                  controller.addProductsToCart(productModel);
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Add to cart',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                    Gap(10.0),
                    Icon(
                      Icons.shopping_cart_outlined,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
