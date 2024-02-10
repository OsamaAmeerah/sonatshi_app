import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sonatshi/logic/controller/cart_controller.dart';
import 'package:sonatshi/logic/controller/category_controller.dart';
import 'package:sonatshi/logic/controller/product_controller.dart';
import 'package:sonatshi/view/screens/product_details_screen.dart';
import 'package:sonatshi/view/widgets/text_utils.dart';

import '../../../model/product_model.dart';
import '../../../utils/theme.dart';

final controller = Get.find<ProductController>();
final cartController = Get.find<CartController>();
final categoryController = Get.find<CategoryController>();

class CategoryItem extends StatelessWidget {
   const CategoryItem({super.key, required this.categoryTitle});

  final String categoryTitle;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.colorScheme.background,
      appBar: AppBar(
        title: Text(
          categoryTitle,
          style: TextStyle(
            color: Get.isDarkMode ? Colors.white : Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: context.theme.colorScheme.background,
      ),
      body: Obx(
        () {
          return ConditionalBuilder(
            condition: !categoryController.isAllCategoryLoading.value,
            builder: (context) => GridView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: categoryController.categoryList.length,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                childAspectRatio: 0.8,
                mainAxisSpacing: 9.0,
                crossAxisSpacing: 6.0,
                maxCrossAxisExtent: 200.0,
              ),
              itemBuilder: (context, index) {
                return buildCardItems(
                  image: categoryController.categoryList[index].image,
                  price: categoryController.categoryList[index].price,
                  rating: categoryController.categoryList[index].rating,
                  productId: categoryController.categoryList[index].id,
                  productModel: categoryController.categoryList[index],
                  onTap: () {
                    Get.to(() => ProductDetailsScreen(
                          productModel: categoryController.categoryList[index],
                        ));
                  },
                );
              },
            ),
            fallback: (context) => Center(
                child: CircularProgressIndicator(
              color: mainLightColor,
            )),
          );
        },
      ),
    );
  }
}

Widget buildCardItems({
  required String image,
  required double price,
  required Rating rating,
  required int productId,
  required ProductModel productModel,
  required Function() onTap,
}) =>
    Padding(
      padding: const EdgeInsets.all(5.0),
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 3.0,
                blurRadius: 5.0,
              ),
            ],
          ),
          child: Column(
            children: [
              Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        controller.manageFavorites(productId);
                      },
                      icon: controller.isFavorite(productId)
                          ? const Icon(
                              Icons.favorite,
                              color: Colors.red,
                              size: 20.0,
                            )
                          : const Icon(
                              Icons.favorite_outline,
                              color: Colors.black,
                              size: 20.0,
                            ),
                    ),
                    IconButton(
                      onPressed: () {
                        cartController.addProductsToCart(productModel);
                        Get.snackbar('Cart', 'The product Added successfully',
                            animationDuration:
                                const Duration(milliseconds: 500),
                            duration: const Duration(milliseconds: 1200));
                      },
                      icon: const Icon(
                        Icons.shopping_cart_outlined,
                        color: Colors.black,
                        size: 20.0,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 140.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.network(
                  image,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 15.0,
                  right: 15.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$ $price',
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    Container(
                      height: 20.0,
                      width: 45.0,
                      decoration: BoxDecoration(
                        color:
                            Get.isDarkMode ? primaryDarkColor : mainLightColor,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 3.0,
                          right: 2.0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextUtils(
                              text: '${rating.rate}',
                              fontSize: 13.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey.shade300,
                            ),
                            const Icon(Icons.star,
                                size: 13.0, color: Colors.amber)
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
