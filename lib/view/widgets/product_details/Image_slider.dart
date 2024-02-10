import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:sonatshi/logic/controller/cart_controller.dart';
import 'package:sonatshi/utils/theme.dart';
import 'package:sonatshi/view/widgets/home_widget/card_items.dart';
import 'package:sonatshi/view/widgets/product_details/color_picker.dart';

import '../../../routes/routes.dart';

class ImageSliders extends StatefulWidget {
  final String imageUrl;
   ImageSliders({super.key, required this.imageUrl});
  @override
  State<ImageSliders> createState() => _ImageSlidersState();
}

class _ImageSlidersState extends State<ImageSliders> {
  final carouselController = CarouselController();
  final CartController controller = Get.find<CartController>();

  final List<Color> colorSelect = [
    kCOlor1,
    kCOlor2,
    kCOlor3,
    kCOlor4,
    kCOlor5,
  ];
  int currentIndex = 0;
  int currentColor = 0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider.builder(
          itemCount: 3,
          carouselController: carouselController,
          options: CarouselOptions(
            height: 500.0,
            autoPlay: true,
            enlargeCenterPage: true,
            enableInfiniteScroll: false,
            autoPlayInterval: const Duration(seconds: 2),
            viewportFraction: 1,
            onPageChanged: (index, reason) {
              setState(() {
                currentIndex = index;
              });
            },
          ),
          itemBuilder: (context, index, realIndex) {
            return Container(
              margin: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    widget.imageUrl,
                  ),
                  fit: BoxFit.fill,
                ),
                borderRadius: BorderRadius.circular(25.0),
              ),
            );
          },
        ),
        Positioned(
          bottom: 30.0,
          left: 180.0,
          child: AnimatedSmoothIndicator(
            activeIndex: currentIndex,
            count: 3,
            effect: ExpandingDotsEffect(
              dotHeight: 10.0,
              dotWidth: 10.0,
              activeDotColor:
                  Get.isDarkMode ? primaryDarkColor : mainLightColor,
            ),
          ),
        ),
        Positioned(
          bottom: 30.0,
          right: 30.0,
          child: Container(
            height: 200.0,
            width: 50.0,
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.3),
              borderRadius: BorderRadius.circular(
                30.0,
              ),
            ),
            child: ListView.separated(
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  setState(() {
                    currentColor = index;
                  });
                },
                child: ColorPicker(
                  outerBorder: currentColor == index,
                  color: colorSelect[index],
                ),
              ),
              separatorBuilder: (context, index) => const Gap(3.0),
              itemCount: colorSelect.length,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(
            top: 20.0,
            left: 25.0,
            right: 25.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Get.isDarkMode
                        ? primaryDarkColor.withOpacity(0.8)
                        : mainLightColor.withOpacity(0.8),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.arrow_back_ios_new,
                    color:Colors.white,
                  ),
                ),
              ),
              Obx(()=>Badge(
                  label: controller.productMap.isNotEmpty
                      ? Text(controller.counter().toString())
                      : const Text('0'),
                  alignment: AlignmentDirectional.topEnd,
                  child: InkWell(
                    onTap: () {
                      Get.toNamed(Routes.cartScreen);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: Get.isDarkMode
                            ? primaryDarkColor.withOpacity(0.8)
                            : mainLightColor.withOpacity(0.8),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.shopping_cart_outlined,
                        color:Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
