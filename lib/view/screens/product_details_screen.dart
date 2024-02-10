import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sonatshi/model/product_model.dart';

import '../widgets/product_details/Image_slider.dart';
import '../widgets/product_details/add_cart.dart';
import '../widgets/product_details/product_info.dart';
import '../widgets/product_details/size_list_screen.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key, required this.productModel});
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.colorScheme.background,
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ImageSliders(imageUrl: productModel.image),
              ProductInfo(
                title: productModel.title,
                productId: productModel.id,
                rate: productModel.rating.rate,
                description: productModel.description,
              ),
             SizeList(),
             AddCart(price: productModel.price,productModel: productModel),
            ],
          ),
        ),
      ),
    );
  }
}
