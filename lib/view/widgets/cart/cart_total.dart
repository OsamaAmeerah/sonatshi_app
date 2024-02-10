import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:sonatshi/logic/controller/cart_controller.dart';
import 'package:sonatshi/view/widgets/text_utils.dart';

import '../../../routes/routes.dart';

class CartTotal extends StatelessWidget {
   CartTotal({super.key});

   final controller = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
      padding: const EdgeInsets.all(25.0),
      child: Row(
        children: [
          Column(
            children: [
              TextUtils(
                text: 'Total',
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Get.isDarkMode ? Colors.white : Colors.black,
              ),
              Text(
                '\$${controller.total}',
                style: TextStyle(
                  color: Get.isDarkMode ? Colors.white70 : Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  height: 1.5,
                ),
              ),

            ],

          ),
          const SizedBox(
            width: 20.0,
          ),
          Expanded(
            child: SizedBox(
              height: 50.0,
              child: ElevatedButton(
                onPressed: () {
                  Get.toNamed(Routes.paymentScreen);
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                        'Check Out'
                    ),
                    Gap(10.0),
                    Icon(Icons.shopping_cart_outlined)
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
