import 'package:awesome_rating/awesome_rating.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';
import 'package:sonatshi/logic/controller/product_controller.dart';
import 'package:sonatshi/utils/theme.dart';
import 'package:sonatshi/view/widgets/text_utils.dart';

class ProductInfo extends StatelessWidget {
  ProductInfo({
      super.key,
      required this.title,
      required this.productId,
      required this.rate,
      required this.description
  });
  final ProductController controller = Get.find();
  final String title;
  final String description;
  final int productId;
  final double rate;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                    color: Get.isDarkMode
                        ? Colors.white.withOpacity(.9)
                        : Colors.grey.withOpacity(.4),
                    shape: BoxShape.circle),
                child: Obx(
                  () => InkWell(
                    onTap: () {
                      controller.manageFavorites(productId);
                    },
                    child: controller.isFavorite(productId)
                        ? const Icon(
                            Icons.favorite,
                            color: Colors.red,
                          )
                        : const Icon(
                            Icons.favorite_outline,
                          ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              TextUtils(
                text: '$rate',
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
                color: Get.isDarkMode ? Colors.white : Colors.black,
              ),
              const Gap(5.0),
              AwesomeStarRating(
                rating: rate,
                defaultIconData: Icons.star_border,
                filledIconData: Icons.star,
                color: Colors.orange,
                borderColor: Colors.orange,
                spacing: 1,
                starCount: 5,
                allowHalfRating: true,
                halfFilledIconData: Icons.star_half,
              )
            ],
          ),
          const Gap(20.0),
          ReadMoreText(
            description,
            trimLines: 3,
            textAlign: TextAlign.justify,
            trimCollapsedText: ' Show more ',
            trimExpandedText: ' Show less ',
            trimMode: TrimMode.Line,
            lessStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: Get.isDarkMode ? primaryDarkColor : mainLightColor,
            ),
            moreStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: Get.isDarkMode ? primaryDarkColor : mainLightColor,
            ),
          ),
        ],
      ),
    );
  }
}
