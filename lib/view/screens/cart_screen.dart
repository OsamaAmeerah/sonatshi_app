import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sonatshi/logic/controller/cart_controller.dart';
import 'package:sonatshi/view/widgets/cart/empty_cart.dart';
import '../widgets/cart/cart_total.dart';
import '../widgets/cart/product_cart.dart';

class CartScreen extends StatelessWidget {
  CartScreen({super.key});

  final controller = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.colorScheme.background,
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Cart',
          ),
          actions: [
            if(controller.productMap.isNotEmpty)
            IconButton(
              onPressed: () {
                controller.clearAllProducts();
              },
              icon: const Icon(
                Icons.backspace_outlined,
              ),
            )
          ],
        ),
        body: Obx(()=>SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 600.0,
                child: ConditionalBuilder(
                  condition: controller.productMap.isNotEmpty,
                  builder:(context)=> ListView.separated(
                    itemBuilder: (context, index) => ProductCart(
                      productModel: controller.productMap.keys.toList()[index], index: index, counter: controller.productMap.values.toList()[index],
                    ),
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 20.0,
                    ),
                    itemCount: controller.productMap.length,
                  ),
                  fallback: (context)=>const EmptyCart(),
                ),
              ),
              if(controller.productMap.isNotEmpty)
               Padding(
                padding: const EdgeInsets.only(
                  bottom: 30.0,
                ),
                child: CartTotal(),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
