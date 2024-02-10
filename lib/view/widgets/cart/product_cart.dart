import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:sonatshi/logic/controller/cart_controller.dart';
import 'package:sonatshi/model/product_model.dart';
import '../../../utils/theme.dart';

class ProductCart extends StatelessWidget {
  ProductCart({
    super.key,
    required this.productModel,
    required this.index,
    required this.counter,
  });

  final ProductModel productModel;
  final controller = Get.find<CartController>();
  final int index;
  final int counter;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Get.isDarkMode
            ? primaryDarkColor.withOpacity(0.7)
            : mainLightColor.withOpacity(0.7),
        borderRadius: BorderRadius.circular(
          20.0,
        ),
      ),
      margin: const EdgeInsets.only(
        left: 20.0,
        right: 20.0,
        top: 5.0,
      ),
      height: 130.0,
      width: 100.0,
      child: Row(
        children: [
          Container(
            height: 120.0,
            width: 100.0,
            margin: const EdgeInsets.only(
              left: 15.0,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.0),
              image: DecorationImage(
                image: NetworkImage(
                  productModel.image,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const Gap(20.0),
          Expanded(
            flex: 15,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productModel.title,
                  maxLines: 1,
                  style: TextStyle(
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const Gap(20.0),
                Text(
                  '\$ ${controller.productSubTotal[index].toStringAsFixed(2)}',
                  maxLines: 1,
                  style: TextStyle(
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 14.0,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      controller.removeProductsFromCart(productModel);
                    },
                    icon: Icon(
                      Icons.remove_circle_outline,
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                    ),
                  ),
                   Text('${counter}'),
                  IconButton(
                    onPressed: () {
                      controller.addProductsToCart(productModel);
                    },
                    icon: Icon(
                      Icons.add_circle_outline,
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                    ),
                  ),
                ],
              ),
              IconButton(
                onPressed: () {
                  controller.removeSingleProductFromCart(productModel);
                },
                icon: Icon(
                  Icons.delete_outline,
                  color: Get.isDarkMode ? Colors.red.shade800 : Colors.black,
                ),
              ),
            ],
          ),
        ],

      ),
    );
  }
}
