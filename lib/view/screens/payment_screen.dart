import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:sonatshi/utils/theme.dart';
import 'package:sonatshi/view/widgets/text_utils.dart';

import '../widgets/payment/delivery_container.dart';
import '../widgets/payment/payment_method.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.theme.colorScheme.background,
        title: const Text('Payment'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(
            15.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextUtils(
                text: 'Shipping to',
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Get.isDarkMode ? Colors.white : Colors.black,
              ),
              const Gap(
                20.0,
              ),
              DeliveryContainerWidget(),
              const Gap(
                20.0,
              ),
              TextUtils(
                text: 'Payment Method',
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Get.isDarkMode ? Colors.white : Colors.black,
              ),
              const Gap(
                20.0,
              ),
              PaymentMethod(),
              const Gap(
                30.0,
              ),
              Center(
                child: TextUtils(
                  text: 'Total: \$200',
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                ),
              ),
              const Gap(
                20.0,
              ),
              Center(
                child: SizedBox(
                  height: 50.0,
                  width: 150.0,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape:  RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0,),
                      ),
                      backgroundColor: Get.isDarkMode ? primaryDarkColor : mainLightColor,
                      elevation: 0.0,
                    ),
                      onPressed: () {},
                      child: const Text('Pay Now',style: TextStyle(
                        fontSize: 22.0,
                        color: Colors.white,
                      ),),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
